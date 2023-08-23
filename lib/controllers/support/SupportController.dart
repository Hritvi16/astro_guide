import 'dart:async';
import 'package:astro_guide/constants/CommonConstants.dart';
import 'package:astro_guide/models/astrologer/AstrologerModel.dart';
import 'package:astro_guide/models/support/SupportModel.dart';
import 'package:astro_guide/providers/SupportProvider.dart';
import 'package:astro_guide/repositories/SupportRepository.dart';
import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:astro_guide/services/networking/ApiService.dart';
import 'package:astro_guide/views/home/support/RequestSupport.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SupportController extends GetxController {
  SupportController();

  final storage = GetStorage();
  final SupportRepository supportRepository = Get.put(SupportRepository(Get.put(ApiService(Get.find()), permanent: true)));
  late SupportProvider supportProvider;

  List<SupportModel> supports = [];


  Timer? countdownTimer;

  @override
  void onInit() {
    super.onInit();
    supportProvider = Get.put(SupportProvider(supportRepository));
    supports = [];
    
    start();
  }

  start() {
    getSupports();
  }

  Future<void> getSupports() async {
    await supportProvider.fetch(storage.read("access"), ApiConstants.userAPI+ApiConstants.all).then((response) async {
      print(response.toJson());
      if(response.code==1) {
        supports = [];
        supports.addAll(response.data??[]);
      }
      update();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }


  Future<void> onRefresh() async{
    await Future.delayed(Duration(seconds: 1));
    await getSupports();
  }

  void onLoading() async{
  }

  void startTimer() {
    if(countdownTimer!=null) {
      stopTimer();
    }

    countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      getSupports();
      stopTimer();
    });
  }

  void stopTimer() {
    countdownTimer!.cancel();
  }

  void goto(String page, {dynamic arguments}) {
    Get.toNamed(page, arguments: arguments)?.then((value) {
      getSupports();
    });
  }

  void requestSupport() {
    Get.bottomSheet(
        isScrollControlled: true,
        RequestSupport()
    ).then((value) {
      print(value);

      if(value!=null) {
        goto("/supportChat", arguments: {"sup_id": value, "status" : "REQUESTED"});
      }
    });
  }
}
