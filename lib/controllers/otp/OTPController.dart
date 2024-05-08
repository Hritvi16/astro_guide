import 'dart:async';
import 'dart:math' as math;
import 'package:astro_guide/colors/MyColors.dart';
import 'package:astro_guide/constants/CommonConstants.dart';
import 'package:astro_guide/providers/UserProvider.dart';
import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:astro_guide/essential/Essential.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:http/http.dart' as http;


class OTPController extends GetxController {

  OTPController();

  final UserProvider userProvider = Get.find();
  TextEditingController otp = TextEditingController();

  late Timer timer;
  late int start_time = 60;
  late String mobile;
  late String code;
  late String email;
  late String verification;

  late String generatedOTP;

  late String whatsapp_url;
  late String instance_id;
  late String access_token;
  late int whatsapp;

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
      textStyle: GoogleFonts.manrope(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: MyColors.colorBorder),
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
    email = Get.arguments['email']??"";
    whatsapp_url = Get.arguments['whatsapp_url'];
    instance_id = Get.arguments['instance_id'];
    access_token = Get.arguments['access_token'];
    whatsapp = Get.arguments['whatsapp'];
    start_time = 60;
    verification = "sms";
    generatedOTP = "";
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
    if(verification=="sms") {
      await auth.verifyPhoneNumber(
        // phoneNumber: '+0096896770565',
        phoneNumber: '$code$mobile',
        verificationCompleted: (PhoneAuthCredential credential) async {
          print("hhhhh");
        },
        codeSent: (String verificationId, int? forceResendingToken) async {
          verificationIDReceived = verificationId;
          update();
          Essential.showSnackBar(message, time: 1);
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          verificationIDReceived = verificationId;
          update();
        },
        verificationFailed: (FirebaseAuthException error) {
          print("error");
          print(error);
          print(error.toString());
        },
      );
    }
    else if(verification=="whatsapp") {
      getOTPByWhatsapp(message);
    }
    else if(verification=="email") {
      getOTPByEmail(String message) async {
        Map<String, dynamic> data = {
          "mobile" : "$code-$mobile"
        };

        userProvider.update(data, CommonConstants.essential, ApiConstants.otp).then((response) async {
          if(response.code==1) {
            generatedOTP = response.data??"";
            update();
            Essential.showSnackBar(message, time: 1);
          }
          else {
            Essential.showSnackBar(response.message, code: response.code);
          }
        });
      }
    }
  }

  void getOTPByEmail(String message) async {
    Map<String, dynamic> data = {
      "mobile" : "$code-$mobile"
    };

    userProvider.update(data, CommonConstants.essential, ApiConstants.otp).then((response) async {
      if(response.code==1) {
        generatedOTP = response.data??"";
        update();
        Essential.showSnackBar(message, time: 1);
      }
      else {
        Essential.showSnackBar(response.message, code: response.code);
      }
    });
  }

  Future<void> getOTPByWhatsapp(String message) async {
    generatedOTP = generateOTP(6);
    update();
    String text = 'Your AstroGuide Application OTP is *${generatedOTP}* Kindly login with this OTP.\nPlease keep it confidential.\n*Thank you*.';
    String url = '${whatsapp_url}/api/send?number=${code.substring(1)}${mobile}&type=media&message=${Uri.encodeComponent(text)}&instance_id=${instance_id}&access_token=${access_token}';
    print(url);
    var res = await http.get(Uri.parse(url));print(res);
    Essential.showSnackBar(message);

  }

  String generateOTP(int length) {
    // Define the characters allowed in the OTP
    const chars = '1234567890';

    // Create a random number generator object
    final math.Random rnd = math.Random();

    // Generate a string of random characters with the desired length
    return String.fromCharCodes(Iterable.generate(
        length, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));
  }

  void resendOTP() {
    print("hello");
    start_time = 60;
    update();
    startTimer();
    verification=="email" ? getOTPByEmail("OTP Resent") : getOTP("OTP Resent");
  }

  Future<String?> checkOTP(String otp) async {
    Essential.showLoadingDialog();
    if(verification=="sms") {
      try {
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: verificationIDReceived, smsCode: otp);

        await auth.signInWithCredential(credential).then((value) {
          print(value);
          Get.back();
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
        Get.back();
        Essential.showSnackBar("Invalid Code", time: 1);
        // Get.snackbar("", "Invalid Code", snackPosition: SnackPosition.BOTTOM,
        //     backgroundColor: MyColors.black,
        //     margin: EdgeInsets.all(5),
        //     colorText: MyColors.white);
        return "Invalid Code";
      }
    }
    else {
      Get.back();
      if(generatedOTP==otp) {
        Get.back(result: "verified");
      }
      else {
        Essential.showSnackBar("Invalid OTP", time: 1);
      }
    }
  }

  void changeType(String type) {
    verification = type;
    update();
    start_time = 60;
    update();
    startTimer();
    getOTP("OTP Sent");
  }

}