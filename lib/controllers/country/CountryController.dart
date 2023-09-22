import 'dart:async';
import 'package:astro_guide/constants/CommonConstants.dart';
import 'package:astro_guide/constants/CountryConstants.dart';
import 'package:astro_guide/essential/Essential.dart';
import 'package:astro_guide/models/country/CountryModel.dart';
import 'package:astro_guide/providers/CountryProvider.dart';
import 'package:astro_guide/repositories/CountryRepository.dart';
import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:astro_guide/services/networking/ApiService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CountryController extends GetxController {
  CountryController();

  final storage = GetStorage();

  late List<CountryModel> countries;
  CountryModel? country;


  @override
  void onInit() {
    super.onInit();
    getCountries();
  }

  @override
  void dispose() {
    super.dispose();
  }


  void getCountries() {
    final CountryRepository countryRepository = Get.put(CountryRepository(Get.put(ApiService(Get.find()), permanent: true)));
    final CountryProvider countryProvider = Get.put(CountryProvider(countryRepository));
    
    countryProvider.fetchList(storage.read("access")).then((response) {
      print(response.toJson());
      if(response.code==1) {
        countries = response.data??[];
        for (var value in countries) {
          if(value.name.toUpperCase()==country?.name.toUpperCase()) {
            country = value;
            break;
          }
        }
        update();
      }
    });
  }
  
  void changeCountry (CountryModel? value) {
    country = value!;
    update();
    back(result: {"countries" : countries, "country" : country});
  }
  
  void back({dynamic result}) {
    Get.back(result: result ?? {"countries" : countries, "country" : country});
  }
}
