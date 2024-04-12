import 'dart:io';

import 'package:astro_guide/shared/widgets/button/Button.dart';
import 'package:astro_guide/size/Spacing.dart';
import 'package:astro_guide/size/WidgetSize.dart';
import 'package:astro_guide/views/loadingScreen/LoadingScreen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:astro_guide/colors/MyColors.dart';
import 'package:astro_guide/controllers/changeMobile/ChangeMobileController.dart';
import 'package:astro_guide/size/MySize.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangeMobile extends StatelessWidget {
  ChangeMobile({ Key? key }) : super(key: key);

  final ChangeMobileController changeMobileController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.colorPrimary,
      resizeToAvoidBottomInset: false,
      body: GetBuilder<ChangeMobileController>(
        builder: (controller) {
          return changeMobileController.load ? Container(
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
                              'Change Mobile No.'.tr,
                              style: GoogleFonts.playfairDisplay(
                                fontSize: 32.0,
                                color: MyColors.black,
                                letterSpacing: 0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Text(
                            ('Verify your ${changeMobileController.verified ? 'new' : 'old'} mobile number').tr,
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
                          color: MyColors.cardColor(),
                          borderRadius: BorderRadius.circular(24)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              '${changeMobileController.verified ? 'New'.tr : 'Old'.tr} ${'Mobile No.'.tr}',
                              style: GoogleFonts.manrope(
                                fontSize: 16.0,
                                letterSpacing: 0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          changeMobileController.verified ? Form(
                            key: changeMobileController.formKey,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: TextFormField(
                                controller: changeMobileController.newMobile,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                style: GoogleFonts.manrope(
                                  fontSize: 16.0,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w400,
                                ),
                                validator: (value) {
                                  if(value=="") {
                                    return "* Required";
                                  }
                                  else {
                                    if(changeMobileController.country.code=="+91") {
                                      if(value!.length!=10) {
                                        return "* Invalid Mobile No.";
                                      }
                                    }
                                    else if(value==changeMobileController.mobile.text) {
                                      return "* You cannot enter same mobile no. as your old";
                                    }
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: MyColors.colorButton,
                                      ),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    hintText: "Enter New Mobile No.".tr,
                                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                                    prefixIcon: GestureDetector(
                                      onTap: () {
                                        changeMobileController.changeCode();
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 14),
                                            child: changeMobileController.country.imageFullUrl.startsWith("http") ?
                                            Image.network(
                                              changeMobileController.country.imageFullUrl,
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
                                              changeMobileController.country.code,
                                              style: GoogleFonts.manrope(
                                                fontSize: 16.0,
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
                              ),
                            ),
                          )
                              : Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: TextFormField(
                              controller: changeMobileController.mobile,
                              readOnly: true,
                              enabled: false,
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
                                  hintText: "Enter Mobile No.".tr,
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                                  prefixIcon: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 14),
                                        child: changeMobileController.ocountry.imageFullUrl.startsWith("http") ?
                                        Image.network(
                                          changeMobileController.ocountry.imageFullUrl,
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
                                          changeMobileController.ocountry.code,
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
                                  )
                              ),
                            ),
                          ),

                          GestureDetector(
                            onTap: () {
                              changeMobileController.verify();
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
                                      'GET OTP'.tr,
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
          ) : LoadingScreen();
        },
      ),
    );
  }
}