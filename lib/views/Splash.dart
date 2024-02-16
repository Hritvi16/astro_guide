import 'dart:io';
import 'package:astro_guide/essential/Essential.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:astro_guide/colors/MyColors.dart';
import 'package:astro_guide/controllers/splash/SplashController.dart';
import 'package:astro_guide/size/MySize.dart';

class Splash extends StatelessWidget {
  Splash({ Key? key }) : super(key: key);

  final SplashController splashController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      body: Center(
        child: Text(
          Essential.getPlatformAppName()
        ),
      ),
    );
  }
}