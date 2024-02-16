import 'dart:async';
import 'package:astro_guide/constants/CommonConstants.dart';
import 'package:astro_guide/dialogs/BasicDialog.dart';
import 'package:astro_guide/essential/Essential.dart';
import 'package:astro_guide/models/horoscope/ashtakoot/AshtakootModel.dart';
import 'package:astro_guide/models/horoscope/basic/BasicKundliModel.dart';
import 'package:astro_guide/models/horoscope/chart/ChartModel.dart';
import 'package:astro_guide/models/horoscope/kp/KPPlanetModel.dart';
import 'package:astro_guide/models/horoscope/vimshottari/VimshottariDashaModel.dart';
import 'package:astro_guide/models/horoscope/yogini/YoginiDashaModel.dart';
import 'package:astro_guide/models/kundli/KundliModel.dart';
import 'package:astro_guide/providers/HoroscopeProvider.dart';
import 'package:astro_guide/providers/UserProvider.dart';
import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class MatchKundliController extends GetxController with GetTickerProviderStateMixin {
  MatchKundliController();

  final storage = GetStorage();
  final UserProvider userProvider = Get.find();
  final HoroscopeProvider horoscopeProvider = Get.find();

  late List<KundliModel> kundlis;
  late List<KundliModel> showKundlis;
  late AshtakootModel ashtakoot;
  late bool load;
  late bool matched;
  late TabController tabController;
  KundliModel? male, female;

  @override
  void onInit() {
    super.onInit();
    load = false;
    matched = false;
    tabController = TabController(length: 2, vsync: this);
    showKundlis = kundlis = [];
    start();
  }

  Future<void> start() async {
    getKundlis();
    // getAshtakootKundli();
  }

  Future<void> getKundlis() async {
    await userProvider.fetchKundlis(storage.read("access"), ApiConstants.kundli).then((response) async {
      print(response.data);
      if(response.code==1) {
        try {
          kundlis = [];
          kundlis.addAll(response.data ?? []);
          setKundlis(CommonConstants.gender.first);
        }
        catch(ex) {

        }
      }

      load = true;
      update();
    });
  }

  Future<void> getAshtakootKundli() async {
    Map<String, dynamic> data = {
      "p1Name" : male?.name??"",
      "p1Dob" : DateFormat("yyyy-MM-dd").format(DateTime.parse(male?.dob??"")),
      "p1Gender" : (male?.gender??"").toLowerCase(),
      "p1Place" : male?.city??"",
      "p2Name" : female?.name??"",
      "p2Dob" : DateFormat("yyyy-MM-dd").format(DateTime.parse(female?.dob??"")),
      "p2Gender" : (female?.gender??"").toLowerCase(),
      "p2Place" : female?.city??"",
    };

    print(data);

    await horoscopeProvider.fetchAshtakoot(storage.read("access"), ApiConstants.ashtakoot, data).then((response) async {
      if(response.code==1) {
        try {
          ashtakoot = response.data ?? ashtakoot;
          matched = true;
        }
        catch(ex) {
          Essential.showSnackBar("Error Matching Kundli");
        }
      }
      else {
        Essential.showSnackBar(response.message);
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
    await getAshtakootKundli();
  }

  void onLoading() async{
  }

  void goto(String page, {dynamic arguments}) {
    Get.toNamed(page, arguments: arguments)?.then((value) {
      print("objecttt");
      onInit();
    });
  }

  double getSingleBlock() {
    return ashtakoot.ashtakoot_milan_result.max_ponits/8;
  }

  dynamic getProperNumber(double points) {
    print(points%1==0);
    print(points%1==0 ? points.toInt() : points);
    return points%1==0 ? points.toInt() : points;
  }

  void changeTab(int index) {
     setKundlis(CommonConstants.gender[index]);

    update();
  }

  void setKundlis(String gender) {
    showKundlis = [];
    for (var element in kundlis) {
      if(element.gender==gender) {
        showKundlis.add(element);
      }
    }
  }

  void selectKundli(KundliModel kundli) {
    if(kundli.gender=="MALE") {
      male = kundli;
    }
    else {
      female = kundli;
    }
    update();
  }

  void validate() {
    if(male!=null && female!=null) {
      getAshtakootKundli();
    }
    else {
      if(male==null) {
        Essential.showSnackBar("Select Male Kundli");
      }
      else {
        Essential.showSnackBar("Select Female Kundli");
      }
    }
  }


  void confirmDelete(KundliModel kundli) {
    Get.dialog(
      const BasicDialog(
        text: "Are you sure you want to delete this kundli?",
        btn1: "Yes",
        btn2: "No",
      ),
      barrierDismissible: false,
    ).then((value) {
      if (value == "Yes") {
        deleteKundli(kundli);
      }
    });
  }

  Future<void> deleteKundli(KundliModel kundli) async {
    await userProvider.delete(storage.read("access"), ApiConstants.kundli+ApiConstants.delete+kundli.id.toString()).then((response) async {
      if(response.code==1) {
        kundlis.remove(kundli);
        storage.remove("kundli_${kundli.id}");
        update();
        setKundlis(CommonConstants.gender[tabController.index]);
        Essential.showSnackBar("Kundli Deleted");
      }
      else {
        Essential.showSnackBar(response.message);
      }
    });
  }
}
