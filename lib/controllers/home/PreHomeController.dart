import 'package:astro_guide/essential/Essential.dart';
import 'package:astro_guide/models/spec/SpecModel.dart';
import 'package:astro_guide/providers/SpecProvider.dart';
import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:astro_guide/shared/widgets/bottomNavigation/BottomNavigation.dart';
import 'package:astro_guide/views/home/chat/Chat.dart';
import 'package:astro_guide/views/home/dashboard/Dashboard.dart';
import 'package:astro_guide/views/home/history/History.dart';
import 'package:astro_guide/views/home/settings/Setting.dart';
import 'package:astro_guide/views/home/talk/Talk.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class PreHomeController extends GetxController {
  PreHomeController();

  final storage = GetStorage();

  final SpecProvider specProvider = Get.find();
  late List<SpecModel> specs;



  @override
  void onInit() {
    specs = [];
    getSpecs();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> getSpecs() async {
    await specProvider.fetch(storage.read("access"), ApiConstants.all).then((response) async {
      print("specssss");
      print(response.toJson());
      if(response.code==1) {
        specs = response.data??[];
        update();
      }
    });
  }

  void goto(String page, {dynamic arguments}) {
    print(page);
    Get.toNamed(page, arguments: arguments);
  }
}
