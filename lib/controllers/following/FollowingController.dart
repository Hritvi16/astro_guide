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

class FollowingController extends GetxController {
  FollowingController();

  final storage = GetStorage();
  final SpecProvider specProvider = Get.find();

  final AstrologerProvider astrologerProvider = Get.find();

  List<AstrologerModel> astrologers = [];

  TextEditingController search = TextEditingController();

  Timer? countdownTimer;
  late bool free;
  late double wallet;
  late bool load;
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

    start();
  }

  start() {
    getAstrologers();
  }

  Future<void> getAstrologers() async {
    String query = "";
    if(search.text.isNotEmpty) {
      query = "UPPER(a.name) LIKE '%${search.text.toUpperCase()}%'";
      query = " WHERE ${query}";
    }

    Map <String, String> data = {
      ApiConstants.search : query,
    };

    print(data);

    await astrologerProvider.fetchByID(storage.read("access"), ApiConstants.followAPI+ApiConstants.user, data).then((response) async {
      if(response.code==1) {
        wallet = response.wallet ?? wallet;
        ivr = response.ivr ?? ivr;
        video = response.video ?? video;
        free = (response.free ?? 1) == 0;
        await storage.write("free", free);
        await storage.write("wallet", wallet);
        await storage.write("ivr", ivr);
        await storage.write("video", video);

        astrologers = [];
        astrologers.addAll(response.data??[]);
      }
      load = true;
      update();
    });
  }

  // Future<void> getAstrologersBySpec(int offset) async {
  //   Map <String, String> data = {
  //     AstrologerConstants.spec_id : spec!.id.toString()
  //   };
  //
  //
  //   await astrologerProvider.fetchByID(storage.read("access"), ApiConstants.specAPI, data).then((response) async {
  //     print(response.toJson());
  //     if(response.code==1) {
  //       if(offset==0) {
  //         astrologers = [];
  //       }
  //       astrologers.addAll(response.data??[]);
  //     }
  //     update();
  //   });
  // }

  @override
  void dispose() {
    super.dispose();
  }


  void manageFollow(int index) {
    Map <String, String> data = {
      CommonConstants.astro_id : astrologers[index].id.toString()
    };
    print(data);

    astrologerProvider.add(storage.read("access"), ApiConstants.followAPI+(astrologers[index].follow==1 ? ApiConstants.remove : ApiConstants.add), data).then((response) {
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
    Get.toNamed(page, arguments: arguments, )?.then((value) {
      print("objecttt");
      onInit();
    });
  }

  void selectCallType(FollowingController followingController, AstrologerModel astrologer) {
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
          "controller": followingController,
          "category": "CALL",
          "call_type": value=="Voice Call" ? "IVR" : "VIDEO",
        });
      }
    });
  }
}
