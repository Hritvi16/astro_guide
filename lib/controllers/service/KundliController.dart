import 'dart:async';
import 'package:astro_guide/constants/CommonConstants.dart';
import 'package:astro_guide/constants/KundliConstants.dart';
import 'package:astro_guide/constants/UserConstants.dart';
import 'package:astro_guide/dialogs/BasicDialog.dart';
import 'package:astro_guide/essential/Essential.dart';
import 'package:astro_guide/models/city/CityModel.dart';
import 'package:astro_guide/models/horoscope/ashtakoot/AshtakootModel.dart';
import 'package:astro_guide/models/horoscope/basic/BasicKundliModel.dart';
import 'package:astro_guide/models/horoscope/chart/ChartModel.dart';
import 'package:astro_guide/models/horoscope/kp/KPPlanetModel.dart';
import 'package:astro_guide/models/horoscope/vimshottari/VimshottariDashaModel.dart';
import 'package:astro_guide/models/horoscope/yogini/YoginiDashaModel.dart';
import 'package:astro_guide/models/kundli/KundliModel.dart';
import 'package:astro_guide/models/relation/RelationModel.dart';
import 'package:astro_guide/providers/HoroscopeProvider.dart';
import 'package:astro_guide/providers/UserProvider.dart';
import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:astro_guide/shared/helpers/extensions/StringExtension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class KundliController extends GetxController with GetTickerProviderStateMixin {
  KundliController();

  final storage = GetStorage();
  final UserProvider userProvider = Get.find();

  late bool load;

  TextEditingController name = TextEditingController();
  // TextEditingController mobile = TextEditingController();
  late TextEditingController dob = TextEditingController();
  late TextEditingController tob = TextEditingController();
  late DateTime date;
  late String gender;
  late String type;
  late String marital_status;

  List<CityModel> cities = [];
  KundliModel? kundli;
  List<RelationModel> relations = [];
  CityModel? city;
  RelationModel? relation;
  late GlobalKey<FormState> formKey;

  @override
  void onInit() {
    super.onInit();
    gender = UserConstants.F;
    marital_status = "";
    date = DateTime.now();
    formKey = GlobalKey<FormState>();
    relations = [RelationModel(id: -1, name: "SELF")];
    if(Get.arguments!=null) {
      kundli = Get.arguments;
    }
    load = false;
    start();
  }

  Future<void> start() async {
    getKundliValues();
  }

  Future<void> getKundliValues() async {
    await userProvider.fetchKundliValues(storage.read("access"), ApiConstants.kundli+ApiConstants.values).then((response) async {
      if(response.code==1) {
        try {
          cities = response.cities ?? [];
          relations.addAll(response.relations?? []);

          if(kundli!=null) {
            setKundliDetails();
          }
        }
        catch(ex) {

        }
      }

      load = true;
      update();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> onRefresh() async{
    await Future.delayed(const Duration(seconds: 1));
  }

  void onLoading() async{
  }

  void changeRelation(RelationModel? value) {
    relation = value!;
    update();
  }

  void changeMaritalStatus(String status) {
    marital_status = status;
    update();
  }

  void changeGender(String value) {
    gender = value;
    update();
  }

  void changeCity(CityModel? value) {
    city = value!;
    update();
  }

  void setDOB(value) {
    if(value!=null) {
      date = DateTime(value.year, value.month, value.day, date.hour, date.minute, date.second);
      dob.text = DateFormat("dd MMM, yyyy").format(date);
      update();
    }
  }

  void setTOB(value) {
    print(value);
    if(value!=null) {
      date = DateTime(date.year, date.month, date.day, value.hour, value.minute);
      tob.text = DateFormat("hh:mm a").format(date);
      update();
    }
  }

  void validate() {
    if(formKey.currentState!.validate()) {
      if(marital_status.isEmpty) {
        Essential.showSnackBar("Please select your marital status", time: 1);
      }
      else {
        manageKundli();
      }
    }
  }

  Future<void> manageKundli() async {
    Essential.showLoadingDialog();

    Map <String, dynamic> data = {
      KundliConstants.r_id : (relation?.id??-1),
      if(kundli!=null)
        KundliConstants.k_id : (kundli?.id??-1),
      KundliConstants.name : name.text,
      KundliConstants.gender : gender,
      KundliConstants.dob : date.toString(),
      KundliConstants.ci_id : city!.id.toString(),
      KundliConstants.marital_status : marital_status,
    };

    print(data);

    await userProvider.update(data, storage.read("access"), ApiConstants.kundli+(kundli==null ? ApiConstants.add : ApiConstants.update)).then((response) async {
      print(response.toJson());
      Get.back();
      if (response.code == 1) {
        Get.back();
        Essential.showSnackBar(response.message);
      }
      else if (response.code == 0) {
        Essential.showSnackBar(response.message);
      }
      else if (response.code != -1) {
        Essential.showSnackBar(response.message);
      }
    });
  }

  void setKundliDetails() {
    name.text = kundli?.name??"";
    gender = kundli?.gender??"";
    DateTime temp = DateTime.parse(kundli?.dob??"");
    setDOB(temp);
    setTOB(temp);
    for (var element in cities) {
      if(element.id==kundli?.ci_id) {
        city = element;
        break;
      }
    }
    if(kundli?.type=="SELF") {
      relation = relations.first;
    }
    else {
      for (var element in relations) {
        if (element.id == kundli?.r_id) {
          relation = element;
          break;
        }
      }
    }
    marital_status = kundli?.marital_status??"";
    if(!load) {
      load = true;
    }
    update();
  }
}
