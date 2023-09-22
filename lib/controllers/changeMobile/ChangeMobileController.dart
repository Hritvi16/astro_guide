

import 'package:astro_guide/constants/CommonConstants.dart';
import 'package:astro_guide/constants/UserConstants.dart';
import 'package:astro_guide/essential/Essential.dart';
import 'package:astro_guide/models/country/CountryModel.dart';
import 'package:astro_guide/models/login/LoginModel.dart';
import 'package:astro_guide/notification_helper/NotificationHelper.dart';
import 'package:astro_guide/providers/CountryProvider.dart';
import 'package:astro_guide/providers/UserProvider.dart';
import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:astro_guide/views/country/Country.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ChangeMobileController extends GetxController {
  ChangeMobileController();

  final storage = GetStorage();

  late GlobalKey<FormState> formKey;

  final TextEditingController mobile = TextEditingController();
  final TextEditingController newMobile = TextEditingController();
  final FocusNode phoneNumberFocusNode = FocusNode();

  late UserProvider userProvider = Get.find();
  late CountryProvider countryProvider = Get.find();
  late bool verified;

  late List<CountryModel> countries;
  late CountryModel ocountry;
  late CountryModel country;
  late bool load;

  @override
  void onInit() {
    // taketo();
    String mob = Get.arguments;
    mobile.text = mob.substring(mob.indexOf("-")+1);
    ocountry = CountryModel(id: -1, name: "", nationality: "", icon: "", code: mob.substring(0, mob.indexOf("-")), imageFullUrl: "");
    verified = false;
    formKey = GlobalKey<FormState>();
    load = false;
    getCountries();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void getCountries() {
    countryProvider.fetchList(storage.read("access")).then((response) {
      print(response.toJson());
      if(response.code==1) {
        countries = response.data??[];
        for (var value in countries) {
          if(value.code.toUpperCase()==ocountry.code) {
            country = value;
            ocountry = value;
            break;
          }
        }
        load = true;
        update();
      }
    });
  }

  goto(String path, dynamic data) {
    print(path);
    Get.toNamed(path, arguments: data)?.then((value) {
      print(value);
      if(value=="verified") {
        print(verified);
        if(verified==false) {
          verified = true;
          update();
        }
        else {
          changeMobileNumber();
        }
      }
    });
  }

  Future<void> verify() async {
    if(verified) {
      if(formKey.currentState!.validate()) {
        Essential.showLoadingDialog();
        await Future.delayed(Duration(seconds: 2));

        final Map<String, String> data = {
          UserConstants.mobile: country.code+"-"+newMobile.text,
        };

        print(data);

        userProvider.login(data, CommonConstants.essential, ApiConstants.verify).then((response) async {
          print(response.toJson());
          Get.back();
          if (response.code == 0) {
            goto("/otp", {"mobile": newMobile.text, "code": country.code});
          }
          else if (response.code == 1) {
            Essential.showSnackBar("Mobile no. already exists.");
          }
          else {
            Essential.showSnackBar(response.message);
          }
        });
      }
    }
    else {
      goto("/otp", {"mobile": mobile.text, "code": country.code});
    }
  }

  Future<void> changeMobileNumber() async {
    Essential.showLoadingDialog();
    await Future.delayed(Duration(seconds: 2));

    final Map<String, String> data = {
      UserConstants.mobile : country.code+"-"+newMobile.text,
    };

    print(data);

    userProvider.update(data, storage.read("access"), ApiConstants.update+ApiConstants.mobile).then((response) async {
      print(response.toJson());
      Get.back();

      if(response.code==1) {
        Get.back(result: "changed");
        Essential.showSnackBar("Mobile number updated successfully");
      }
      else {
        Essential.showSnackBar(response.message);
      }
    });
  }

  void goToHome(LoginModel response) {
    storage.write("access", response.access_token);
    storage.write("refresh", response.refresh_token);
    storage.write("status", "logged in");
    Get.offAllNamed("/home");
  }

  void changeCode() {
    Get.bottomSheet(
        isScrollControlled: true,
        Country(countries, country)
    ).then((value) {
      print(value);

      if(value!=null) {
        countries = value['countries'];
        country = value['country'];
        update();
      }
    });
  }

}
