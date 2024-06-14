import 'dart:io';

import 'package:astro_guide/constants/CommonConstants.dart';
import 'package:astro_guide/essential/Essential.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
// import 'package:astro_guide/providers/UserProvider.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:astro_guide/cache_manager/CacheManager.dart';
import 'package:in_app_update/in_app_update.dart';

class SplashController extends GetxController {
  SplashController();

  final storage = GetStorage();

  // late UserProvider userProvider = Get.find();
  FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;

  @override
  void onInit() {
    storage.write("popup", false);
    initDynamicLinks();
    taketo();
    super.onInit();
  }

  Future<void> taketo() async {
    if(!storage.hasData("fcm")) {
      // NotificationHelper.generateFcmToken(userProvider);
    }

    if(Platform.isAndroid) {
      print("hellooo");
      await checkForUpdate();
    }

    Future.delayed(Duration(seconds: 3), () async {
      CacheManager.deleteKeys();
      if (storage.read("status") == "logged in") {
        Get.offAllNamed(Essential.getPlatform() ? '/home' : '/preHome');
      }
      else {
        await storage.write("access", CommonConstants.essential);
        await storage.write("refresh", "");
        Get.offAllNamed('/login');
      }

      // await storage.write("popbanner", 0);

    });

  }

  Future<void> initDynamicLinks() async {
    dynamicLinks.onLink.listen((dynamicLinkData) {
      print("linkkk");
      print(dynamicLinkData);
    }).onError((error) {
      print('onLink error');
      print(error.message);
    });
  }


  Future<void> checkForUpdate() async {
    await InAppUpdate.checkForUpdate().then((info) async {
      if(info?.updateAvailability == UpdateAvailability.updateAvailable) {
        try {
          print(await InAppUpdate.performImmediateUpdate());
        }
        catch(ex) {
          print("exxxxxxx");
          print(ex);
        }
      }
    }).catchError((e) {
      print(e.toString());
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
