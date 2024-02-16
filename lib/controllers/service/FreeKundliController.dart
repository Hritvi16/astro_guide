import 'dart:async';
import 'package:astro_guide/constants/CommonConstants.dart';
import 'package:astro_guide/dialogs/BasicDialog.dart';
import 'package:astro_guide/essential/Essential.dart';
import 'package:astro_guide/models/horoscope/basic/BasicKundliModel.dart';
import 'package:astro_guide/models/horoscope/chart/ChartModel.dart';
import 'package:astro_guide/models/horoscope/kp/KPPlanetModel.dart';
import 'package:astro_guide/models/horoscope/planet/PlanetModel.dart';
import 'package:astro_guide/models/horoscope/storage/StorageKundliModel.dart';
import 'package:astro_guide/models/horoscope/vimshottari/VimMahaDashaModel.dart';
import 'package:astro_guide/models/horoscope/vimshottari/VimshottariDashaModel.dart';
import 'package:astro_guide/models/horoscope/yogini/YoginiDashaModel.dart';
import 'package:astro_guide/models/kundli/KundliModel.dart';
import 'package:astro_guide/providers/HoroscopeProvider.dart';
import 'package:astro_guide/providers/UserProvider.dart';
import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class FreeKundliController extends GetxController with GetTickerProviderStateMixin {
  FreeKundliController();

  final storage = GetStorage();
  final UserProvider userProvider = Get.find();
  final HoroscopeProvider horoscopeProvider = Get.find();

  late BasicKundliModel basic;
  late List<PlanetModel> planet;
  late List<KPPlanetModel> kpPlanet;
  late VimshottariDashaModel vimshottari;
  late YoginiDashaModel yogini;
  late Map<String, ChartModel> charts;
  late List<KundliModel> kundlis;
  KundliModel? kundli;

  late int selected;
  late int selectedDasha;
  late int selectedPlanet;
  late DateTime now;

  late bool load;
  late TabController tabController;
  late int selectedDiv;
  int? id;
  late int dasha_level;
  late VimMahaDashaModel antar_dasha;
  late VimMahaDashaModel pratyantar_dasha;

  @override
  void onInit() {
    super.onInit();
    selected = 1;
    selectedDasha = 0;
    selectedPlanet = 0;
    selectedDiv = 0;
    dasha_level = 0;
    now = DateTime.now();
    kpPlanet = [];
    charts = {};
    load = false;
    kundlis = [];
    tabController = TabController(length: 3, vsync: this);
    start();
  }

  Future<void> start() async {
    await getKundlis();
  }

  Future<void> getKundlis() async {
    await userProvider.fetchKundlis(storage.read("access"), ApiConstants.kundli).then((response) async {
      print(response.data);
      if(response.code==1) {
        try {
          kundlis = [];
          kundlis.addAll(response.data ?? []);
        }
        catch(ex) {

        }
      }

      if(Get.arguments==null) {
        load = true;
        update();
      }
      else {
        update();
        for (var element in kundlis) {
          if(element.id==Get.arguments) {
            selectKundli(element);
          }
        }
      }
    });
  }

  Future<void> getKundli() async {
    await getBasicKundli();
    await getCharts(CommonConstants.charts[0]);
    await getCharts(CommonConstants.charts[1]);
    await getCharts(CommonConstants.divCharts[0]);
    await getCharts(CommonConstants.divCharts[1]);
    await getCharts(CommonConstants.divCharts[2]);
    await getCharts(CommonConstants.divCharts[3]);
    await getCharts(CommonConstants.divCharts[4]);
    await getCharts(CommonConstants.divCharts[5]);
    await getCharts(CommonConstants.divCharts[6]);
    await getCharts(CommonConstants.divCharts[7]);
    await getCharts(CommonConstants.divCharts[8]);
    await getCharts(CommonConstants.divCharts[9]);
    await getCharts(CommonConstants.divCharts[10]);
    await getCharts(CommonConstants.divCharts[11]);
    await getCharts(CommonConstants.divCharts[12]);
    await getCharts(CommonConstants.divCharts[13]);
    await getCharts(CommonConstants.divCharts[14]);
    await getCharts(CommonConstants.divCharts[15]);
    await getPlanetKundli();
    await getKPPlanetKundli();
    await getVimshottariDasha();
    await getYoginiDasha();
  }

  Future<void> getBasicKundli() async {
    String convertedTimezone = convertToNumericOffset(now.timeZoneOffset);

    Map<String, dynamic> data = {
      "timezone" : convertedTimezone,
      "id" : kundli?.id??"",
    };

    print(data);

    await horoscopeProvider.fetchBasicKundli(storage.read("access"), ApiConstants.basic, data).then((response) async {
      if(response.code==1) {
        try {
          basic = response.data ?? basic;
        }
        catch(ex) {

        }
      }

      // load = true;
      update();
    });
  }

  Future<void> getCharts(String key) async {
    String convertedTimezone = convertToNumericOffset(now.timeZoneOffset);

    Map<String, dynamic> data = {
      "timezone" : convertedTimezone,
      "id" : kundli?.id??"",
      "chart" : CommonConstants.chartDetails[key]?['chart']
    };

    print(data);

    await horoscopeProvider.fetchCharts(storage.read("access"), ApiConstants.charts, data).then((response) async {
      if(response.code==1) {
        try {
          charts[key] = response.data!;
        }
        catch(ex) {

        }
      }

      // load = true;
      update();
    });
  }

  Future<void> getPlanetKundli() async {
    String convertedTimezone = convertToNumericOffset(now.timeZoneOffset);

    Map<String, dynamic> data = {
      "timezone" : convertedTimezone,
      "id" : kundli?.id??"",
    };

    print(data);

    await horoscopeProvider.fetchPlanetKundli(storage.read("access"), ApiConstants.planet, data).then((response) async {
      if(response.code==1) {
        try {
          planet = response.data?.planets ?? planet;
        }
        catch(ex) {

        }
      }

      // load = true;
      update();
    });
  }

  Future<void> getKPPlanetKundli() async {
    String convertedTimezone = convertToNumericOffset(now.timeZoneOffset);

    Map<String, dynamic> data = {
      "timezone" : convertedTimezone,
      "id" : kundli?.id??"",
    };

    print(data);

    await horoscopeProvider.fetchKPPlanetKundli(storage.read("access"), ApiConstants.kp+ApiConstants.planet, data).then((response) async {
      if(response.code==1) {
        try {
          kpPlanet = response.data?.table_data ?? kpPlanet;
        }
        catch(ex) {

        }
      }

      // load = true;
      update();
    });
  }

  Future<void> getVimshottariDasha() async {
    String convertedTimezone = convertToNumericOffset(now.timeZoneOffset);

    Map<String, dynamic> data = {
      "timezone" : convertedTimezone,
      "id" : kundli?.id??"",
    };

    print(data);

    await horoscopeProvider.fetchVimshottariDasha(storage.read("access"), ApiConstants.vimdasha, data).then((response) async {
      if(response.code==1) {
        try {
          vimshottari = response.data ?? vimshottari;
        }
        catch(ex) {

        }
      }

      // load = true;
      update();
    });
  }

  Future<void> getYoginiDasha() async {
    String convertedTimezone = convertToNumericOffset(now.timeZoneOffset);

    Map<String, dynamic> data = {
      "timezone" : convertedTimezone,
      "id" : kundli?.id??"",
    };

    print(data);

    await horoscopeProvider.fetchYoginiDasha(storage.read("access"), ApiConstants.yogini, data).then((response) async {
      if(response.code==1) {
        try {
          yogini = response.data ?? yogini;
        }
        catch(ex) {

        }
      }

      load = true;
      update();

      storage.write("kundli_${kundli?.id??-1}", StorageKundliModel(basic: basic, planet: planet, kpPlanet: kpPlanet, vimshottari: vimshottari, yogini: yogini, charts: charts));
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
    await getBasicKundli();
    // await getKundli(1);
    // await getKundli(2);
  }

  void onLoading() async{
  }

  void goto(String page, {dynamic arguments}) {
    Get.toNamed(page, arguments: arguments)?.then((value) {
      print("objecttt");
      onInit();
    });
  }

  void changeTab(int index) {
    if(selected!=index) {
      selected = index;
      update();
    }
  }

  void changeChartTab(int index) {
    // if(tabController.index!=index) {
    //   selected = index;
      update();
    // }
  }

  void changeDashaTab(int index) {
    print(selectedDasha);
    print(index);
    print(selectedDasha!=index);
    if(selectedDasha!=index) {
      selectedDasha = index;
      update();
    }
  }

  void changePlanetTab(int index) {
    print(selectedPlanet);
    print(index);
    print(selectedPlanet!=index);
    if(selectedPlanet!=index) {
      selectedPlanet = index;
      update();
    }
  }

  String getChartSVG() {
    String svg = "";
    if(tabController.index==0) {
      svg = charts[CommonConstants.charts[0]]?.svg??"";
    }
    else if(tabController.index==1) {
      svg = charts[CommonConstants.charts[1]]?.svg??"";
    }
    else {
      svg = charts[CommonConstants.divCharts[selectedDiv]]?.svg??"";
    }
    return svg;
  }

  void changeDivChartTab(int index) {
    if(selectedDiv!=index) {
      selectedDiv = index;
      update();
    }
  }

  void selectKundli(KundliModel kundli) {
    this.kundli = kundli;

    if(storage.read("kundli_${kundli.id}")!=null) {
      print(storage.read("kundli_${kundli.id}"));
      try {
        StorageKundliModel storageKundli = storage.read("kundli_${kundli.id}");
        basic = storageKundli.basic;
        planet = storageKundli.planet;
        kpPlanet = storageKundli.kpPlanet;
        vimshottari = storageKundli.vimshottari;
        yogini = storageKundli.yogini;
        charts = storageKundli.charts;
        load = true;
        update();
      }
      catch(ex) {

        load = false;
        update();
        getKundli();
      }
    }
    else {
      load = false;
      update();
      getKundli();
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
        Essential.showSnackBar("Kundli Deleted");
      }
      else {
        Essential.showSnackBar(response.message);
      }
    });
  }

  Map<String, dynamic> getVimDasha() {
    if(dasha_level==0) {
      return vimshottari.maha_dasha.toJson();
    }
    else if(dasha_level==1) {
      return antar_dasha.toJson();
    }
    else if(dasha_level==2) {
      return pratyantar_dasha.toJson();
    }
    return {};
  }

  void updateDashaLevel(VimMahaDashaModel dasha) {
    dasha_level += 1;
    update();
    if(dasha_level==1) {
      antar_dasha = dasha;
      update();
    }
    if(dasha_level==2) {
      pratyantar_dasha = dasha;
      update();
    }

  }
  void jumpDashaLevel(int level) {
    dasha_level = level;
    update();
  }
}
