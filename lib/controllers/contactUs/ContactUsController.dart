import 'dart:convert';
import 'package:astro_guide/models/setting/SettingModel.dart';
import 'package:astro_guide/views/home/settings/ContactUs.dart';
import 'package:get/get.dart';
import 'package:html_unescape/html_unescape.dart';

class ContactUsController extends GetxController {
  ContactUsController();

  late SettingModel setting;

  @override
  void onInit() {
    setting = Get.arguments;
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
