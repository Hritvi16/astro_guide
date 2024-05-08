import 'dart:async';
import 'package:astro_guide/providers/HoroscopeProvider.dart';
import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class NumeroscopeController extends GetxController {
  NumeroscopeController();

  final storage = GetStorage();
  final HoroscopeProvider horoscopeProvider = Get.find();
  late int selectedDay;
  late int selectedNumber;
  late DateTime now;

  late List<String> numeroscopes;
  late bool load;

  @override
  void onInit() {
    super.onInit();
    selectedDay = 1;
    selectedNumber = 0;
    now = DateTime.now();
    numeroscopes = [];
    load = false;
    start();
  }

  Future<void> start() async {
    String date = DateFormat("yyyy-MM-dd").format(DateTime.now());
    if(storage.read("numeroscope_${selectedNumber}_$date")==null) {
      await getNumeroscope(0);
      await getNumeroscope(1);
      await getNumeroscope(2);
    }
    else {
      try {
        numeroscopes = storage.read("numeroscope_${selectedNumber}_$date");
      }
      catch(ex) {
        await getNumeroscope(0);
        await getNumeroscope(1);
        await getNumeroscope(2);
      }
    }
  }

  Future<void> getNumeroscope(int day) async {

    String convertedTimezone = convertToNumericOffset(now.timeZoneOffset);
    int sign = selectedNumber;

    Map<String, dynamic> data = {
      "number" : sign+1,
      "date" : DateFormat("yyyy-MM-dd").format(day==0 ? now.subtract(const Duration(days: 1)) : day==1 ? now : now.add(const Duration(days: 1))),
      "timezone" : convertedTimezone,
    };

    print(data);

    await horoscopeProvider.fetchNumeroscope(storage.read("access"), ApiConstants.numerology, data).then((response) async {
      if(response.code==1) {
        if(day<=(numeroscopes.length-1)) {
          numeroscopes[day] = response.data??numeroscopes[day];
        }
        else {
          numeroscopes.add(response.data!);
        }
      }

      if(day==2) {
        load = true;
        String date = DateFormat("yyyy-MM-dd").format(DateTime.now());
        print("numeroscope_${sign}_$date");
        print(numeroscopes);
        List<String> temp = [];
        temp.addAll(numeroscopes);
        await storage.write("numeroscope_${sign}_$date", temp);
      }
      update();
    });
  }
  String convertToNumericOffset(Duration offset) {
    print(offset);
    int hours = offset.inHours;
    double mins = offset.inMinutes-(hours*60);
    return "$hours${mins>0 ? ".${((mins*100)/60).toPrecision(0).toInt()}" : ""}";
  }
  @override
  void dispose() {
    super.dispose();
  }

  Future<void> onRefresh() async{
    await Future.delayed(const Duration(seconds: 1));
    await getNumeroscope(0);
    await getNumeroscope(1);
    await getNumeroscope(2);
  }

  void onLoading() async{
  }

  void goto(String page, {dynamic arguments}) {
    Get.toNamed(page, arguments: arguments)?.then((value) {
      print("objecttt");
      onInit();
    });
  }

  void changeDayTab(int index) {
    if(selectedDay!=index) {
      selectedDay = index;
      update();
    }
  }

  Future<void> changeSign(int index) async {
    if(selectedNumber!=index) {
      selectedNumber = index;
      load = false;
      update();

      String date = DateFormat("yyyy-MM-dd").format(DateTime.now());
      print("numeroscope_${selectedNumber}_$date");
      print(storage.read("numeroscope_${selectedNumber}_$date"));
      if(storage.read("numeroscope_${selectedNumber}_$date")==null) {
        await getNumeroscope(0);
        await getNumeroscope(1);
        await getNumeroscope(2);
      }
      else {
        try {
          numeroscopes = storage.read("numeroscope_${selectedNumber}_$date");
          load = true;
          update();
        }
        catch(ex) {
          await getNumeroscope(0);
          await getNumeroscope(1);
          await getNumeroscope(2);
        }
      }
    }
  }

  String getDate() {
    return DateFormat("dd MMM, yyyy").format(selectedDay==0 ? now.subtract(const Duration(days: 1)) : selectedDay==1 ? now : now.add(const Duration(days: 1)));
  }
}
