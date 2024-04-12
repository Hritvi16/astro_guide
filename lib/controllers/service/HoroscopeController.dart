import 'dart:async';
import 'package:astro_guide/constants/CommonConstants.dart';
import 'package:astro_guide/models/horoscope/horoscope/HoroscopeModel.dart';
import 'package:astro_guide/providers/HoroscopeProvider.dart';
import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class HoroscopeController extends GetxController {
  HoroscopeController();

  final storage = GetStorage();
  final HoroscopeProvider horoscopeProvider = Get.find();
  late int selectedDay;
  late int selectedSign;
  late DateTime now;

  late List<HoroscopeModel> horoscopes;
  late bool load;

  @override
  void onInit() {
    super.onInit();
    selectedDay = 1;
    selectedSign = 0;
    now = DateTime.now();
    horoscopes = [];
    load = false;
    start();
  }

  Future<void> start() async {
    String date = DateFormat("yyyy-MM-dd").format(DateTime.now());
    if(storage.read("zodiac_${selectedSign}_$date")==null) {
      await getHoroscope(0);
      await getHoroscope(1);
      await getHoroscope(2);
    }
    else {
      try {
        horoscopes = storage.read("zodiac_${selectedSign}_$date");
      }
      catch(ex) {
        await getHoroscope(0);
        await getHoroscope(1);
        await getHoroscope(2);
      }
    }
  }

  Future<void> getHoroscope(int day) async {

    String convertedTimezone = convertToNumericOffset(now.timeZoneOffset);
    int sign = selectedSign;

    Map<String, dynamic> data = {
      "sign" : CommonConstants.zodiac_signs[selectedSign].toUpperCase(),
      "date" : DateFormat("yyyy-MM-dd").format(day==0 ? now.subtract(const Duration(days: 1)) : day==1 ? now : now.add(const Duration(days: 1))),
      "timezone" : convertedTimezone,
    };

    print(data);

    await horoscopeProvider.fetchHoroscope(storage.read("access"), ApiConstants.daily, data).then((response) async {
      if(response.code==1) {
        if(day<=(horoscopes.length-1)) {
          horoscopes[day] = response.data??horoscopes[day];
        }
        else {
          horoscopes.add(response.data!);
        }
      }

      if(day==2) {
        load = true;
        String date = DateFormat("yyyy-MM-dd").format(DateTime.now());
        print("zodiac_${sign}_$date");
        print(horoscopes);
        List<HoroscopeModel> temp = [];
        temp.addAll(horoscopes);
        await storage.write("zodiac_${sign}_$date", temp);
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
    await getHoroscope(0);
    await getHoroscope(1);
    await getHoroscope(2);
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
    if(selectedSign!=index) {
      selectedSign = index;
      load = false;
      update();

      String date = DateFormat("yyyy-MM-dd").format(DateTime.now());
      print("zodiac_${selectedSign}_$date");
      print(storage.read("zodiac_${selectedSign}_$date"));
      if(storage.read("zodiac_${selectedSign}_$date")==null) {
        await getHoroscope(0);
        await getHoroscope(1);
        await getHoroscope(2);
      }
      else {
        try {
          horoscopes = storage.read("zodiac_${selectedSign}_$date");
          load = true;
          update();
        }
        catch(ex) {
          await getHoroscope(0);
          await getHoroscope(1);
          await getHoroscope(2);
        }
      }
    }
  }

  String getDate() {
    return DateFormat("dd MMM, yyyy").format(selectedDay==0 ? now.subtract(const Duration(days: 1)) : selectedDay==1 ? now : now.add(const Duration(days: 1)));
  }
}
