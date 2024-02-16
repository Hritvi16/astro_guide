import 'dart:async';
import 'package:astro_guide/constants/CommonConstants.dart';
import 'package:astro_guide/essential/Essential.dart';
import 'package:astro_guide/models/astrologer/AstrologerModel.dart';
import 'package:astro_guide/models/country/CountryModel.dart';
import 'package:astro_guide/models/language/LanguageModel.dart';
import 'package:astro_guide/models/spec/SpecModel.dart';
import 'package:astro_guide/models/type/TypeModel.dart';
import 'package:astro_guide/providers/AstrologerProvider.dart';
import 'package:astro_guide/providers/SpecProvider.dart';
import 'package:astro_guide/repositories/AstrologerRepository.dart';
import 'package:astro_guide/repositories/SpecRepository.dart';
import 'package:astro_guide/services/networking/ApiService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AstroFilterController extends GetxController {
  AstroFilterController();

  final storage = GetStorage();

  late List<String> filters;
  late String filter;

  List<String> sort = [];
  late String ssort;

  late List<TypeModel> types;
  late List<TypeModel> stypes;
  late List<LanguageModel> langs;
  late List<LanguageModel> slangs;
  late List<String> gender;
  late List<String> sgender;
  late List<CountryModel> countries;
  late List<CountryModel> scountries;

  late List<AstrologerModel> astrologers;

  TextEditingController search = TextEditingController();

  Timer? countdownTimer;
  late bool free;
  late double wallet;

  @override
  void onInit() {
    super.onInit();

    print("init");

    filters = CommonConstants.filters;
    filter = filters.first;

    if(!Essential.getPlatform()) {
      filters.remove("Expertise");
    }

    types = [];
    stypes = [];
    langs = [];
    slangs = [];

    astrologers = [];

    free = storage.read("free")??false;

    print("gdgdgd"+storage.read("wallet").toString());
    wallet = double.parse((storage.read("wallet")??0.0).toString());

  }

  @override
  void dispose() {
    super.dispose();
  }

  void changeSortBy (String? value) {
    ssort = value!;
    update();
  }

  void changeFilter(String value) {
    filter = value;
    update();
  }

  void changeType(bool? value, TypeModel option) {
    if(value==true) {
      stypes.add(option);
    }
    else if(value==false) {
      stypes.remove(option);
    }
    update();
  }

  void changeLanguage(bool? value, LanguageModel option) {
    if(value==true) {
      slangs.add(option);
    }
    else if(value==false) {
      slangs.remove(option);
    }
    update();
  }

  void changeGender(bool? value, String option) {
    if(value==true) {
      sgender.add(option);
    }
    else if(value==false) {
      sgender.remove(option);
    }
    update();
  }

  void changeCountry(bool? value, CountryModel option) {
    if(value==true) {
      scountries.add(option);
    }
    else if(value==false) {
      scountries.remove(option);
    }
    update();
  }

  void reset() {
    ssort = sort.first;
    stypes = [];
    slangs = [];
    sgender = [];
    scountries = [];
    update();
  }

  void apply() {
    Get.back(result: {
      "ssort" : ssort,
      "stypes" : stypes,
      "slangs" : slangs,
      "sgender" : sgender,
      "scountries" : scountries,
    });
  }

  void back() {
    Get.back();
  }
}
