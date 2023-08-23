import 'dart:async';
import 'package:astro_guide/providers/ServiceProvider.dart';
import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HoroscopeController extends GetxController {
  HoroscopeController();

  final storage = GetStorage();
  final ServiceProvider serviceProvider = Get.find();

  @override
  void onInit() {
    super.onInit();
    start();
  }

  start() {
    getHoroscope();
  }

  Future<void> getHoroscope() async {
    await serviceProvider.fetchHoroscope(storage.read("access"), ApiConstants.horoscope).then((response) async {
      if(response.code==1) {
      }
      update();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> onRefresh() async{
    await Future.delayed(Duration(seconds: 1));
    await getHoroscope();
  }

  void onLoading() async{
  }

  void goto(String page, {dynamic arguments}) {
    Get.toNamed(page, arguments: arguments)?.then((value) {
      print("objecttt");
      onInit();
    });
  }
}
