import 'dart:async';
import 'dart:developer';
import 'package:astro_guide/essential/Essential.dart';
import 'package:astro_guide/models/astrologer/AstrologerModel.dart';
import 'package:astro_guide/views/home/call/utils/api.dart';
import 'package:astro_guide/views/home/call/utils/toast.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class JoinScreenController extends GetxController {
  JoinScreenController();

  final storage = GetStorage();

  String token = "";

  // Control Status
  bool isMicOn = false;
  bool isCameraOn = false;

  bool? isJoinMeetingSelected;
  bool? isCreateMeetingSelected;

  // Camera Controller
  CameraController? cameraController;
  late AstrologerModel astrologer;

  @override
  void onInit() {
    astrologer = Get.arguments;
    initCameraPreview();
    super.onInit();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final token = await fetchToken();
      this.token = token;
      update();
    });
  }

  void initCameraPreview() {
    // Get available cameras
    availableCameras().then((availableCameras) {
      // stores selected camera id
      int selectedCameraId = availableCameras.length > 1 ? 1 : 0;

      cameraController = CameraController(
        availableCameras[selectedCameraId],
        ResolutionPreset.medium,
        imageFormatGroup: ImageFormatGroup.yuv420,
      );
      log("Starting Camera");
      cameraController!.initialize().then((_) {
        update();
      });
    }).catchError((err) {
      log("Error: $err");
    });
  }

  Future<bool> onWillPopScope() async {
    if (isJoinMeetingSelected != null && isCreateMeetingSelected != null) {
      isJoinMeetingSelected = null;
      isCreateMeetingSelected = null;
      update();
      return false;
    } else {
      return true;
    }
  }


  void updateMic() {
    isMicOn = !isMicOn;
    update();
  }

  void updateCamera() {
    isCameraOn = !isCameraOn;
    update();
  }

  void updateMeeting(bool create, bool join) {
    isCreateMeetingSelected = create;
    isJoinMeetingSelected = join;
    update();
  }

  Future<void> createAndJoinMeeting(callType, displayName) async {
    final token = await fetchToken();
    print(token);
    var meetingID = await createMeeting(token);
    try {
      Get.offAllNamed(
        '/oneToOneMeet',
        arguments: {
          "token" : token,
          "meetingId" : meetingID,
          "displayName" : displayName,
          "micEnabled" : isMicOn,
          "camEnabled": isCameraOn}
      );
    } catch (error) {

      //showSnackBarMessage(message: error.toString(), context: context);
      Essential.showSnackBar("Create and Join Meeting");
    }
  }

  Future<void> onClickMeetingJoin(callType, displayName, meetingId) async {
    if (meetingId.isEmpty) {
      Essential.showSnackBar("Please enter Valid Meeting ID");
      return;
    }
    var validMeeting = await validateMeeting(token, meetingId);
    if (validMeeting) {
      Get.offAllNamed(
          '/oneToOneMeet',
          arguments: {
            "token" : token,
            "meetingId" : meetingId,
            "displayName" : displayName,
            "micEnabled" : isMicOn,
            "camEnabled": isCameraOn}
      );
    } else {
      Essential.showSnackBar("Invalid Meeting ID");
    }
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.dispose();
  }

}
