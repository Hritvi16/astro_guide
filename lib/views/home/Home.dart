import 'package:astro_guide/colors/MyColors.dart';
import 'package:astro_guide/controllers/home/HomeController.dart';
import 'package:astro_guide/shared/widgets/bottomNavigation/BottomNavigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  Home({ Key? key }) : super(key: key);

  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GetBuilder<HomeController>(
      builder: (controller) {
        return WillPopScope(
          onWillPop: () async {
            if(homeController.current!=0) {
              homeController.changeTab(0);
              return false;
            }
            return true;
          },
          child: Scaffold(
            bottomNavigationBar: BottomNavigation(
              backgroundColor: MyColors.colorPrimary,
              current: homeController.current,
              size: homeController.size,
              items: homeController.items,
              controller : homeController
            ),
            body: homeController.screens[homeController.current]
          ),
        );
      },
    );
  }
}