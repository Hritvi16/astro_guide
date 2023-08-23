import 'dart:async';
import 'package:astro_guide/languages/Languages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LanguageController extends GetxController {
  LanguageController();

  final storage = GetStorage();

  List<Map<String, String>> languages = [];
  late Map<String, String> messages;
  Map<String, String>? language;

  @override
  void onInit() {
    languages = Languages().languages.entries.map((entry){
      if(entry.key==storage.read("language")) {
        language = {entry.key : entry.value};
      }
      return {entry.key : entry.value};
    }).toList();

    messages = Languages().messages;

    if(storage.read("language")==null) {
      storage.write("language", languages.first.entries.first.key);
      language = {languages.first.entries.first.key : languages.first.entries.first.value};
    }
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> changeLanguage(Map<String, String> language) async {
    this.language = language;
    storage.write("language", language.entries.first.key);
    update();

    Get.updateLocale(Locale(language.entries.first.key));
  }

}
