import 'dart:async';

import 'package:astro_guide/constants/AstrologerConstants.dart';
import 'package:astro_guide/constants/CommonConstants.dart';
import 'package:astro_guide/constants/UserConstants.dart';
import 'package:astro_guide/dialogs/BasicDialog.dart';
import 'package:astro_guide/dialogs/IconConfirmDialog.dart';
import 'package:astro_guide/essential/Essential.dart';
import 'package:astro_guide/models/astrologer/AstrologerModel.dart';
import 'package:astro_guide/models/spec/SpecModel.dart';
import 'package:astro_guide/providers/AstrologerProvider.dart';
import 'package:astro_guide/providers/SpecProvider.dart';
import 'package:astro_guide/repositories/AstrologerRepository.dart';
import 'package:astro_guide/repositories/SpecRepository.dart';
import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:astro_guide/services/networking/ApiService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SimilarController extends GetxController {
  SimilarController();

  final storage = GetStorage();
  final SpecProvider specProvider = Get.find();

  final AstrologerProvider astrologerProvider = Get.find();

  late List<AstrologerModel> astrologers;

  TextEditingController search = TextEditingController();

  Timer? countdownTimer;
  late bool free;
  late double wallet;
  late bool load;
  late String id;
  late int ivr, video;

  @override
  void onInit() {
    super.onInit();
    print("init");
    free = storage.read("free")??false;
    wallet = double.parse((storage.read("wallet")??0.0).toString());
    ivr = int.parse((storage.read("ivr")??0).toString());
    video = int.parse((storage.read("video")??1).toString());
    load = false;
    id = Get.arguments['id']??"-1";
    astrologers = Get.arguments['astrologers']??[];
    start();
  }

  start() {
    getAstrologers();
  }

  Future<void> getAstrologers({String? id}) async {
    Map <String, String> data = {
      AstrologerConstants.id : id??this.id
    };

    print(data);

    await astrologerProvider.fetchSingle(storage.read("access"), ApiConstants.id, data).then((response) async {
      print(response.toJson());
      print(response.types);
      if(response.code==-3) {
        Essential.showSnackBar(response.message, code: response.code, time: response.code==-3 ? 3 : null);
      }
      else {
        if (response.code == 1) {
          astrologers = response.similar ?? [];
        }
        load = true;
        update();
      }
    });
  }


  @override
  void dispose() {
    super.dispose();
  }


  void manageFavorite(int index) {
    Map <String, String> data = {
      CommonConstants.astro_id : astrologers[index].id.toString()
    };
    print(data);

    astrologerProvider.add(storage.read("access"), ApiConstants.favouriteAPI+(astrologers[index].fav==1 ? ApiConstants.remove : ApiConstants.add), data).then((response) {
      Essential.showSnackBar(response.message, time: 1, code: response.code);
      if(response.code==1) {
        astrologers.remove(astrologers[index]);
        // astrologers[index] = astrologers[index].copyWith(fav: astrologers[index].fav==1 ? 0 : 1);
        update();
      }
    });
  }

  Future<void> onRefresh() async{
    await Future.delayed(Duration(seconds: 1));
    await getAstrologers();
  }

  void onLoading() async{
  }

  void startTimer() {
    if(countdownTimer!=null) {
      stopTimer();
    }

    countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      getAstrologers();
      stopTimer();
    });
  }

  void stopTimer() {
    countdownTimer!.cancel();
  }

  void goto(String page, {dynamic arguments}) {
    Get.toNamed(page, arguments: arguments)?.then((value) {
      print("objecttt");
      onInit();
    });
  }

  void selectCallType(SimilarController similarController, AstrologerModel astrologer)  {
    Get.dialog(
      const IconConfirmDialog(
        title: "Select Call Type",
        text: "",
        btn1: "Voice Call",
        btn2: "Video Call",
        icon1: Icons.call,
        icon2: Icons.videocam_rounded,
      ),
      barrierDismissible: false,
    ).then((value) {
      if (value!=null) {
        goto("/checkSession", arguments: {
          "astrologer": astrologer,
          "free": free && astrologer.free == 1,
          "controller": similarController,
          "category": "CALL",
          "call_type": value=="Voice Call" ? "IVR" : "VIDEO",
        });
      }
    });
  }
}
