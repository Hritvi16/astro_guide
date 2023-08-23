import 'package:astro_guide/size/WidgetSize.dart';
import 'package:flutter/material.dart';

Widget standardButton({required BuildContext context, required Color backgroundColor, required Widget child, Color? borderColor, EdgeInsetsGeometry? margin, EdgeInsetsGeometry? padding, AlignmentGeometry? alignment, double? height}) {
  return Container(
    height: height??standardButtonHeight,
    width: standardButtonWidth,
    margin: margin,
    padding: padding,
    alignment: alignment,
    decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: borderColor??backgroundColor
        )
    ),
    child: child,
  );
}

Widget standardInfoButton({required BuildContext context, required Color backgroundColor, required Widget child, Color? borderColor, EdgeInsetsGeometry? margin, EdgeInsetsGeometry? padding, AlignmentGeometry? alignment}) {
  return Container(
    height: standardInfoButtonHeight,
    width: standardButtonWidth,
    margin: margin,
    padding: padding,
    alignment: alignment,
    decoration: BoxDecoration(
        color: backgroundColor,
        image: DecorationImage(
          image: AssetImage(
            "assets/backgrounds/button_bg.png",
          )
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: borderColor??backgroundColor
        )
    ),
    child: child,
  );
}