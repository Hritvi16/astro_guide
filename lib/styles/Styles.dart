import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:astro_guide/colors/MyColors.dart';
import 'package:google_fonts/google_fonts.dart';

getNameTitle(String text, theme) {
  return Text(
    text,
    style: theme.textTheme.headline6?.copyWith(fontWeight: FontWeight.w700,),
  );
}

getInfo(String text, theme) {
  return Text(
    text,
    style: theme.textTheme.subtitle1?.copyWith(fontWeight: FontWeight.w600, color: MyColors.colorSecondary),
  );
}

getTabTitle(String text, Color color, FontWeight fontWeight, theme) {
  return Text(
    text,
    style: theme.textTheme.caption?.copyWith(
      fontWeight: fontWeight,
      color: color
    ),
  );
}

getFilterTitle(String text, theme) {
  return Text(
    text,
    style: theme.textTheme.bodyLarge?.copyWith(
      fontWeight: FontWeight.w500,
      color: MyColors.white
    ),
  );
}

getFilterOption(String text, Color color, FontWeight fontWeight, theme) {
  return Text(
    text,
    style: theme.textTheme.bodyText2?.copyWith(
      fontWeight: fontWeight,
      color: color
    ),
  );
}

getSalesTitle(String text1, String text2, theme) {
  return RichText(
    text: TextSpan(
      text: text1,
      children: [
        TextSpan(
          text: text2,
          style: GoogleFonts.manrope(
            color: MyColors.colorDarkPrimary
          )
        )
      ],
      style: theme.textTheme.headline6?.copyWith(fontWeight: FontWeight.w700,)
    ),
  );
}

getLabelInfo(String text, theme) {
  return Text(
    text,
    style: theme.textTheme.subtitle2
  );
}

getTeamTitle(String text, theme) {
  return Text(
    text,
    style: theme.textTheme.subtitle2.copyWith(fontWeight: FontWeight.w600, color: MyColors.colorDarkPrimary)
  );
}

getTeamInfo(String text, theme) {
  return Text(
    text,
    style: theme.textTheme.subtitle2.copyWith(fontWeight: FontWeight.w600,)
  );
}

getHeading(String text, theme) {
  return Text(
    text,
    style: theme.textTheme.headline3
  );
}

getTitle(String text, theme) {
  return Text(
    text,
    style: theme.textTheme.headline5
  );
}

getPageTitle(String text, Color color, theme) {
  return Text(
    text,
    style: theme.textTheme.headline6.copyWith(
      color: color
    )
  );
}

getInfoDuo(String text, String info, theme) {
  return TextSpan(
    text: text,
    // maxLines: 1,
    // overflow: TextOverflow.ellipsis,
    style: theme.textTheme.subtitle1.copyWith(fontWeight: FontWeight.w600,),
    children: [
      TextSpan(
        text: info,
        style: theme.textTheme.subtitle2,
      )
    ]
  );
}

getColouredTitle(String text, theme, Color color) {
  return Text(
      text,
      style: theme.textTheme.headline5?.copyWith(
        color: color,
      )
  );
}

getInfoTitle(String text, theme) {
  return Text(
      text,
      style: theme.textTheme.subtitle2?.copyWith(
        fontWeight: FontWeight.w500,
      )
  );
}

getInfoTitle2(String text, theme) {
  return Text(
      text,
      style: GoogleFonts.manrope(
        fontWeight: FontWeight.w500,
      )
  );
}

getPrice(String price, String discount, theme) {
  return RichText(
    text: TextSpan(
      text: price,
      style: theme.textTheme.headline4.copyWith(
        decoration: TextDecoration.lineThrough
      ),
      children: [
        TextSpan(
          text: discount,
          style: theme.textTheme.headline4
        )
      ]
    ),
  );
}

getDescription(String text, theme) {
  return Text(
    text,
    style: theme.textTheme.bodyLarge
  );
}

getProductTitle(String text, theme) {
  return Text(
    text,
    style: theme.textTheme.headline4?.copyWith(
      color: MyColors.white
    )
  );
}

getProductInfo(String text, theme) {
  return Text(
      text,
      style: theme.textTheme.bodyLarge?.copyWith(
          color: MyColors.white
      )
  );
}

getAlertInfo(String text, theme) {
  return Text(
      text,
      style: theme.textTheme.bodyLarge?.copyWith(
          color: Get.isDarkMode ? MyColors.black : MyColors.white
      )
  );
}

getDashboardTitle(String text, theme) {
  return Text(
      text,
      style: theme.textTheme.subtitle2?.copyWith(color: MyColors.white,)
  );
}

getDashboardData(String text, theme) {
  return Text(
      text,
      style: theme.textTheme.headline6?.copyWith(
        color: MyColors.white,
        fontWeight: FontWeight.w600,
      )
  );
}


getBusinessTitle(String text, theme) {
  return Text(
      text,
      style: theme.textTheme.headline6?.copyWith(
        color: Get.isDarkMode ? MyColors.black : MyColors.white
      )
  );
}

getBusinessData(String text, theme) {
  return Text(
      text,
      style: theme.textTheme.subtitle1?.copyWith(
        color: Get.isDarkMode ? MyColors.black : MyColors.white,
        fontWeight: FontWeight.w600,
      )
  );
}

getLabelTitle(String text) {
  return Text(
    text,
    style: GoogleFonts.manrope(
      color: MyColors.black,
      backgroundColor: MyColors.white,
      fontSize: 18,
      fontWeight: FontWeight.w700
    )
  );
}

getProfileInitial(String text) {
  return Text(
      text,
      style: GoogleFonts.manrope(
          color: Get.isDarkMode ? MyColors.black : MyColors.white,
          fontSize: 35,
          fontWeight: FontWeight.w500
      )
  );
}
