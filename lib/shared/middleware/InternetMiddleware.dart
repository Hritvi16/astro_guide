import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InternetMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    checkConnectivity(route);
  }

  Future<void> checkConnectivity(String? route) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    print(connectivityResult);
    if (connectivityResult == ConnectivityResult.none) {
      Get.offNamed('/noInternet');
    }
    else {
      Get.toNamed(route!);
    }
  }
}