
import 'package:astro_guide/colors/MyColors.dart';
import 'package:astro_guide/size/WidgetSize.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Widget CustomAppBar(String title, {Widget? options, bool? arrow, CrossAxisAlignment? crossAxisAlignment}) {
  return Padding(
    padding:  EdgeInsets.symmetric(horizontal: standardHorizontalPagePadding,),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: crossAxisAlignment??CrossAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if(arrow??true)
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Image.asset(
                          "assets/controls/arrow_previous.png",
                          color: MyColors.black,
                          height: standardBackPressButtonHeight,
                          width: standardBackPressButtonWidth,
                        ),
                      ),
                      SizedBox(
                        width: standardBackPressGap,
                      ),
                    ],
                  ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    title,
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 22.0,
                      color: MyColors.black,
                      letterSpacing: 0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            if(options!=null)
              options
          ],
        ),
      ],
    ),
  );
}