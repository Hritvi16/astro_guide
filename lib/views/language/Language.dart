
import 'package:astro_guide/colors/MyColors.dart';
import 'package:astro_guide/constants/CommonConstants.dart';
import 'package:astro_guide/controllers/language/LanguageController.dart';
import 'package:astro_guide/models/astrologer/AstrologerModel.dart';
import 'package:astro_guide/models/package/PackageModel.dart';
import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:astro_guide/shared/CustomClipPath.dart';
import 'package:astro_guide/shared/widgets/button/Button.dart';
import 'package:astro_guide/shared/widgets/customAppBar/CustomAppBar.dart';
import 'package:astro_guide/size/MySize.dart';
import 'package:astro_guide/size/WidgetSize.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;


class Language extends StatelessWidget {
  Language({ Key? key }) : super(key: key);

  final LanguageController languageController = Get.find();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GetBuilder<LanguageController>(
      builder: (controller) {
        return Scaffold(
          body: getBody(context),
        );
      },
    );
  }

  Widget getBody(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MySize.size100(context),
          height: standardUpperFixedDesignHeight,
          child: ClipPath(
            clipper: CustomClipPath(),
            child: Container(
              decoration: BoxDecoration(
                  color: MyColors.colorPrimary,
                  image: const DecorationImage(
                      image: AssetImage(
                          "assets/essential/upper_bg.png"
                      )
                  )
              ),
              child: SafeArea(
                child: CustomAppBar('Choose Language'.tr),
              ),
            ),
          ),
        ),
        Container(
          width: MySize.size100(context),
          height: MySize.sizeh100(context) - standardUpperFixedDesignHeight,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/essential/bg.png")
            )
          ),
          child: GridView.custom(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(
              horizontal: 20
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                mainAxisExtent: standardLangCardHeight
              // childAspectRatio: 3/4,
            ),
            childrenDelegate: SliverChildBuilderDelegate(
                  (context, index) {
                return getLanguageDesign(index, languageController.languages[index], context);
              },
              childCount: languageController.languages.length,
            ),
          ),
        )
      ],
    );
  }

  Widget getLanguageDesign(int index, Map<String, String> language, BuildContext context) {
    return GestureDetector(
      onTap: () {
        languageController.changeLanguage(language);
      },
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        decoration: BoxDecoration(
          color: language.entries.first.key == languageController.language?.entries.first.key ? MyColors.colorPrimary.withOpacity(0.4) : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: MyColors.colorButton
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              languageController.messages[language.entries.first.key]??"",
              style: GoogleFonts.manrope(
                  fontSize: 26.0,
                  fontWeight: FontWeight.w600,
              )
            ),
            SizedBox(
              height: 5,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                language.entries.first.value.tr,
                style: GoogleFonts.manrope(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}