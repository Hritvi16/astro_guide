import 'dart:io';

import 'package:astro_guide/essential/Essential.dart';
import 'package:astro_guide/size/Spacing.dart';
import 'package:astro_guide/size/WidgetSize.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:astro_guide/colors/MyColors.dart';
import 'package:astro_guide/controllers/login/LoginController.dart';
import 'package:astro_guide/size/MySize.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:intl_phone_number_input/intl_phone_number_input.dart';
// import 'package:libphonenumber/libphonenumber.dart';

import '../../shared/widgets/button/Button.dart';

class Login extends StatelessWidget {
  Login({ Key? key }) : super(key: key);

  final LoginController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.colorPrimary,
      resizeToAvoidBottomInset: false,
      body: GetBuilder<LoginController>(
        builder: (controiller) {
          return Container(
            width: MySize.size100(context),
            height: MySize.sizeh100(context),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration:  BoxDecoration(
                image: Essential.getPlatform() ? DecorationImage(
                    image: AssetImage(
                        "assets/essential/upper_bg_s.png"
                    )
                ) : null
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
                            "assets/app_icon/${Essential.getPlatformLogo()}",
                            height: 72,
                            width: 72,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25.0, bottom: 8),
                            child: Text(
                              'User Login',
                              style: GoogleFonts.playfairDisplay(
                                fontSize: 32.0,
                                color: MyColors.black,
                                letterSpacing: 0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Text(
                            'Login to ${Essential.getPlatformAppName()} and first chat\nwith ${Essential.getPlatformWord()} is free!',
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
                    Form(
                      key: loginController.formKey,
                      child: Container(
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
                                'Mobile No.',
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
                              child: TextFormField(
                                controller: loginController.mobile,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                style: GoogleFonts.manrope(
                                  fontSize: 16.0,
                                  color: MyColors.black,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w400,
                                ),
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: MyColors.colorButton,
                                      ),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    hintText: "Enter Mobile No.",
                                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                                    prefixIcon: GestureDetector(
                                      onTap: () {
                                        loginController.changeCode();
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 14),
                                            child: loginController.country.imageFullUrl.startsWith("http") ?
                                            Image.network(
                                              loginController.country.imageFullUrl,
                                              height: 24,
                                              width: 33,
                                            )
                                                : Image.asset(
                                              "assets/country/India.png",
                                              height: 24,
                                              width: 33,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 5),
                                            child: Text(
                                              loginController.country.code,
                                              style: GoogleFonts.manrope(
                                                fontSize: 16.0,
                                                color: MyColors.black,
                                                letterSpacing: 0,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(right: 5),
                                            color: MyColors.colorDivider,
                                            width: 2,
                                            height: 20,
                                          )
                                        ],
                                      ),
                                    )
                                ),
                                validator: (value) {
                                  if(value!.isEmpty) {
                                    return "* Required";
                                  }
                                  else {
                                    if(loginController.country.code=="+91") {
                                      if(value!.length!=10) {
                                        return "* Invalid Mobile No.";
                                      }
                                    }
                                    return null;
                                  }
                                },
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                'By Login, you agree to our Terms & Conditions and Privacy Policy.',
                                style: GoogleFonts.manrope(
                                  fontSize: 12.0,
                                  color: MyColors.black,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                loginController.validate();
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
                                        'GET OTP',
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
                    ),
                    if(Essential.getPlatform())
                     Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: Image.asset(
                              "assets/login/or.png"
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            loginController.loginWithGoogle();
                          },
                          child: standardButton(
                            context: context,
                            backgroundColor: MyColors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/social/google.png",
                                  height: 24,
                                  width: 24,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: standardHTIS),
                                  child: Text(
                                    'Login with Gmail',
                                    style: GoogleFonts.manrope(
                                      fontSize: 16.0,
                                      color: MyColors.black,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        if(Platform.isIOS)
                          GestureDetector(
                            onTap: () {
                              // loginController.loginWithApple();
                            },
                            child: standardButton(
                              context: context,
                              backgroundColor: MyColors.black,
                              margin: EdgeInsets.only(top: standardVBS),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/social/apple.png",
                                    height: 24,
                                    width: 24,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: standardHTIS),
                                    child: Text(
                                      'Login with Apple',
                                      style: GoogleFonts.manrope(
                                        fontSize: 16.0,
                                        color: MyColors.white,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        GestureDetector(
                          onTap: () {
                            // loginController.loginWithFacebook();
                          },
                          child: standardButton(
                            context: context,
                            backgroundColor: MyColors.colorFacebook,
                            borderColor: MyColors.white,
                            margin: EdgeInsets.only(top: standardVBS),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/social/facebook.png",
                                  height: 24,
                                  width: 24,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: standardHTIS),
                                  child: Text(
                                    'Login with Facebook',
                                    style: GoogleFonts.manrope(
                                      fontSize: 16.0,
                                      color: MyColors.white,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                    // Container(
                    //   padding: EdgeInsets.only(top: standardVTBS, bottom: 10),
                    //   alignment: Alignment.center,
                    //   child: RichText(
                    //     text: TextSpan(
                    //         text: "Don’t have an account? ",
                    //         style: GoogleFonts.manrope(
                    //           fontSize: 16.0,
                    //           color: MyColors.black,
                    //           letterSpacing: 0,
                    //           fontWeight: FontWeight.w500,
                    //         ),
                    //         children: [
                    //           TextSpan(
                    //               text: "Sign Up",
                    //               style: GoogleFonts.manrope(
                    //                 fontWeight: FontWeight.w600,
                    //               ),
                    //               recognizer: TapGestureRecognizer()..onTap = () {
                    //                 loginController.goto("/signUp", "");
                    //               }
                    //           )
                    //         ]
                    //     ),
                    //   ),
                    // )
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