import 'dart:io';

import 'package:astro_guide/size/Spacing.dart';
import 'package:astro_guide/size/WidgetSize.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:astro_guide/colors/MyColors.dart';
import 'package:astro_guide/controllers/otp/OTPController.dart';
import 'package:astro_guide/size/MySize.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import '../../shared/widgets/button/Button.dart';

class OTP extends StatelessWidget {
  OTP({ Key? key }) : super(key: key);

  final OTPController otpController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.colorPrimary,
      resizeToAvoidBottomInset: false,
      body: GetBuilder<OTPController>(
        builder: (controller) {
          return Container(
            width: MySize.size100(context),
            height: MySize.sizeh100(context),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        "assets/essential/upper_bg_s.png"
                    )
                )
            ),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/app_icon/icon_box.png",
                            height: 72,
                            width: 72,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25.0, bottom: 8),
                            child: Text(
                              'Verify Mobile No.'.tr,
                              style: GoogleFonts.playfairDisplay(
                                fontSize: 32.0,
                                color: MyColors.black,
                                letterSpacing: 0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Text(
                            '${'Verify your phone number'.tr}\n${otpController.code} ${otpController.mobile}',
                            style: GoogleFonts.manrope(
                              fontSize: 18.0,
                              color: MyColors.black11,
                              letterSpacing: 0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: MyColors.white,
                          borderRadius: BorderRadius.circular(24)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              'One Time Password',
                              style: GoogleFonts.manrope(
                                fontSize: 16.0,
                                color: MyColors.black,
                                letterSpacing: 0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Pinput(
                              controller: otpController.otp,
                              length: 6,
                              defaultPinTheme: otpController.defaultPinTheme,
                              focusedPinTheme: otpController.focusedPinTheme,
                              submittedPinTheme: otpController.submittedPinTheme,
                              // validator: (otp) {
                              //   return otpController.checkOTP(otp);
                              // },
                              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                              showCursor: true,
                              onCompleted: (pin) {
                                // otpController.checkOTP(pin);
                                print(otpController);
                              },
                            ),
                          ),

                          // Padding(
                          //   padding: const EdgeInsets.symmetric(horizontal: 10),
                          //   child: Align(
                          //     alignment: Alignment.centerRight,
                          //     child: Text(
                          //       "${otpController.start_time} secs",
                          //       style: GoogleFonts.manrope(
                          //         fontSize: 12.0,
                          //         color: MyColors.black,
                          //         letterSpacing: 0,
                          //         fontWeight: FontWeight.w500,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Center(
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  text: "${"Didn't receive code?".tr}\n",
                                  style: GoogleFonts.manrope(
                                    fontSize: 12.0,
                                    color: MyColors.black,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: otpController.start_time==0 ? "Resend".tr : "${"Resend".tr} in ${otpController.start_time} secs",
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: otpController.start_time==0 ? MyColors.black : MyColors.colorGrey
                                      ),
                                      recognizer: TapGestureRecognizer()..onTap = () {
                                        otpController.resendOTP();
                                      }
                                    )
                                  ]
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              otpController.checkOTP(otpController.otp.text);
                            },
                            child: standardButton(
                              context: context,
                              backgroundColor: MyColors.colorButton,
                              margin: const EdgeInsets.only(top: 24),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: standardHTIS),
                                    child: Text(
                                      'VERIFY OTP'.tr,
                                      style: GoogleFonts.manrope(
                                        fontSize: 16.0,
                                        color: MyColors.white,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Image.asset(
                                    "assets/controls/arrow_next.png",
                                    height: standardArrowH,
                                    width: standardArrowW,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}