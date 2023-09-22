import 'package:astro_guide/colors/MyColors.dart';
import 'package:astro_guide/size/Spacing.dart';
import 'package:astro_guide/size/WidgetSize.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget standardTFLabel({required String text, String? optional, Color? optionalColor, double? optionalFontSize}) {
  return Padding(
    padding: EdgeInsets.only(left: 10, top: standardVTBS),
    child: Row(
      children: [
        Text(
          text,
          style: GoogleFonts.manrope(
            fontSize: 16.0,
            letterSpacing: 0,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          optional??"",
          style: GoogleFonts.manrope(
            fontSize: optionalFontSize,
            color: optionalColor,
            letterSpacing: 0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    ),
  );
}