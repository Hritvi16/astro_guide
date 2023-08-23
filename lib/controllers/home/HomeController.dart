import 'package:astro_guide/essential/Essential.dart';
import 'package:astro_guide/shared/widgets/bottomNavigation/BottomNavigation.dart';
import 'package:astro_guide/views/home/chat/Chat.dart';
import 'package:astro_guide/views/home/dashboard/Dashboard.dart';
import 'package:astro_guide/views/home/history/History.dart';
import 'package:astro_guide/views/home/settings/Setting.dart';
import 'package:astro_guide/views/home/talk/Talk.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  HomeController();

  final storage = GetStorage();
  int current = 0;
  int size = 4;
  List<BottomNavItem> items = [
    BottomNavItem(
      icon: "assets/dashboard/home"
    ),
    BottomNavItem(
      icon: "assets/dashboard/call_chat"
    ),
    BottomNavItem(
      icon: "assets/dashboard/history"
    ),
    BottomNavItem(
      icon: "assets/dashboard/settings"
    ),
  ];

  List<Widget> screens = [
    Dashboard(),
    Container(),
    Container(),
    Container(),
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void changeTab(int index) {
    current = index;
    update();
    if(current==0) {
      screens[index] = Dashboard();
      Dashboard().dashboardController.onInit();
    }
    else if(current==1) {
      screens[index] = Talk();
      Talk().talkController.onInit();
    }
    else if(current==2) {
      screens[index] = History();
      History().historyController.onInit();
    }
    else if(current==3) {
      screens[index] = Setting();
      Setting().settingController.onInit();
    }
  }

}
