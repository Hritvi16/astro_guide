import 'dart:async';
import 'package:astro_guide/colors/MyColors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:astro_guide/essential/Essential.dart';
import 'package:pinput/pinput.dart';


class OTPController extends GetxController {

  OTPController();

  TextEditingController otp = TextEditingController();

  late Timer timer;
  late int start_time = 60;
  late String mobile;
  late String code;

  late String generatedOTP;

  late String verificationIDReceived;

  late FirebaseAuth auth;

  late PinTheme defaultPinTheme;
  late PinTheme focusedPinTheme;
  late PinTheme submittedPinTheme;

  @override
  void onInit() {
    super.onInit();
    auth = FirebaseAuth.instance;
    defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(12),
      ),
    );

    focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: MyColors.colorButton),
      borderRadius: BorderRadius.circular(8),
    );

    submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: MyColors.colorLightPrimary,
      ),
    );

    mobile = Get.arguments['mobile'];
    code = Get.arguments['code'];
    start_time = 60;
    startTimer();

    getOTP("OTP Sent");
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec, (Timer timer) {
      if (start_time == 0) {
        timer.cancel();
      } else {
        start_time--;
      }
      update();
    },
    );
  }

  getOTP(String message) async {
    await auth.verifyPhoneNumber(
      phoneNumber: '$code$mobile',
      verificationCompleted: (PhoneAuthCredential credential) async {
      },
      codeSent: (String verificationId, int? forceResendingToken) async {
        verificationIDReceived = verificationId;
        Essential.showSnackBar(message, time: 1);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        verificationIDReceived = verificationId;
        update();
      },
      verificationFailed: (FirebaseAuthException error) {
        print(error);
        print(error.toString());
      },
    );
  }

  void resendOTP() {
    print("hello");
    start_time = 60;
    update();
    startTimer();
    getOTP("OTP Resent");
  }

  Future<String?> checkOTP(String otp) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationIDReceived, smsCode: otp);
    try {
      await auth.signInWithCredential(credential).then((value) {
        print(value);
        if (value.user != null) {
          Get.back(result: "verified");
          return null;
        }
        else {
          Essential.showSnackBar("Invalid OTP", time: 1);
          return "Invalid OTP";
          // Get.snackbar("", "Invalid OTP", snackPosition: SnackPosition.BOTTOM,
          //     backgroundColor: MyColors.black,
          //     margin: EdgeInsets.all(5),
          //     colorText: MyColors.white);
        }
      });
    } catch (e1) {
      print(e1.toString());
      Essential.showSnackBar("Invalid Code", time: 1);
      // Get.snackbar("", "Invalid Code", snackPosition: SnackPosition.BOTTOM,
      //     backgroundColor: MyColors.black,
      //     margin: EdgeInsets.all(5),
      //     colorText: MyColors.white);
      return "Invalid Code";
    }
  }

}