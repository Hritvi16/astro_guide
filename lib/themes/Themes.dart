import 'package:google_fonts/google_fonts.dart';
import 'package:astro_guide/colors/MyColors.dart';
import 'package:flutter/material.dart';

class Themes {
  static ThemeData lightTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    checkboxTheme: CheckboxThemeData(
      visualDensity: VisualDensity.compact, // Sets density to standard
    ),
    textSelectionTheme: TextSelectionThemeData(
        cursorColor: MyColors.colorButton
    ),
    textTheme: GoogleFonts.latoTextTheme(
        TextTheme(
            headline1: GoogleFonts.manrope(
                letterSpacing: -1.5,
                fontSize: 48,
                color: Colors.black,
                fontWeight: FontWeight.bold
            ),
            headline2: GoogleFonts.manrope(
                letterSpacing: -1.0,
                fontSize: 40,
                color: Colors.black,
                fontWeight: FontWeight.bold
            ),
            headline3: GoogleFonts.manrope(
                letterSpacing: -1.0,
                fontSize: 32,
                color: Colors.black,
                fontWeight: FontWeight.bold
            ),
            headline4: GoogleFonts.manrope(
                letterSpacing: -1.0,
                color: Colors.black,
                fontSize: 28,
                fontWeight: FontWeight.w600
            ),
            headline5: GoogleFonts.manrope(
                letterSpacing: -1.0,
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w500
            ),
            headline6: GoogleFonts.manrope(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w500
            ),
            subtitle1: GoogleFonts.manrope(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500
            ),
            subtitle2: GoogleFonts.manrope(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500
            ),
            bodyText1: GoogleFonts.manrope(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w400
            ),
            bodyText2: GoogleFonts.manrope(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w400
            ),
            button: GoogleFonts.manrope(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600
            ),
            caption: GoogleFonts.manrope(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w400
            ),
            overline: GoogleFonts.manrope(
                color: Colors.black,
                fontSize: 10,
                fontWeight: FontWeight.w400,
                letterSpacing: -0.5
            )
        )
    ),
    primarySwatch: MyColors.generateMaterialColor(MyColors.colorPrimary),
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      titleTextStyle: GoogleFonts.manrope(
        color: MyColors.black,
        fontWeight: FontWeight.w600
      ),
      iconTheme: IconThemeData(
        color: MyColors.black
      ),
      backgroundColor: MyColors.grey,
      elevation: 0
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: MyColors.colorButton
        ),
        borderRadius: BorderRadius.circular(10)
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: MyColors.colorButton
        ),
        borderRadius: BorderRadius.circular(10)
      ),
      hintStyle: GoogleFonts.manrope(
        fontSize: 14,
      ),
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: MyColors.red
    ),

  );

  static ThemeData darkTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    checkboxTheme: CheckboxThemeData(
      visualDensity: VisualDensity.standard, // Sets density to standard
    ),
    textSelectionTheme: TextSelectionThemeData(
        cursorColor: MyColors.colorButton
    ),
    textTheme: GoogleFonts.latoTextTheme(
        TextTheme(
            headline1: GoogleFonts.manrope(
                letterSpacing: -1.5,
                fontSize: 48,
                color: Colors.grey.shade50,
                fontWeight: FontWeight.bold
            ),
            headline2: GoogleFonts.manrope(
                letterSpacing: -1.0,
                fontSize: 40,
                color: Colors.grey.shade50,
                fontWeight: FontWeight.bold
            ),
            headline3: GoogleFonts.manrope(
                letterSpacing: -1.0,
                fontSize: 32,
                color: Colors.grey.shade50,
                fontWeight: FontWeight.bold
            ),
            headline4: GoogleFonts.manrope(
                letterSpacing: -1.0,
                color: Colors.grey.shade50,
                fontSize: 28,
                fontWeight: FontWeight.w600
            ),
            headline5: GoogleFonts.manrope(
                letterSpacing: -1.0,
                color: Colors.grey.shade50,
                fontSize: 24,
                fontWeight: FontWeight.w500
            ),
            headline6: GoogleFonts.manrope(
                color: Colors.grey.shade50,
                fontSize: 18,
                fontWeight: FontWeight.w500
            ),
            subtitle1: GoogleFonts.manrope(
                color: Colors.grey.shade50,
                fontSize: 16,
                fontWeight: FontWeight.w500
            ),
            subtitle2: GoogleFonts.manrope(
                color: Colors.grey.shade50,
                fontSize: 14,
                fontWeight: FontWeight.w500
            ),
            bodyText1: GoogleFonts.manrope(
                color: Colors.grey.shade50,
                fontSize: 16,
                fontWeight: FontWeight.w400
            ),
            bodyText2: GoogleFonts.manrope(
                color: Colors.grey.shade50,
                fontSize: 14,
                fontWeight: FontWeight.w400
            ),
            button: GoogleFonts.manrope(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600
            ),
            caption: GoogleFonts.manrope(
                color: Colors.grey.shade50,
                fontSize: 12,
                fontWeight: FontWeight.w500
            ),
            overline: GoogleFonts.manrope(
                color: Colors.grey.shade50,
                fontSize: 10,
                fontWeight: FontWeight.w400
            )
        )
    ),
    primaryColor: MyColors.colorPrimary,
    primarySwatch: MyColors.generateMaterialColor(MyColors.colorPrimary),
    brightness: Brightness.dark,
    scaffoldBackgroundColor: MyColors.black,
    appBarTheme: AppBarTheme(
      backgroundColor: MyColors.gray900,
      elevation: 0,
      iconTheme: IconThemeData(
        color: MyColors.white
      ),
    ),
    bottomAppBarColor: MyColors.gray900,
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(
            color: MyColors.colorButton
        ),
        borderRadius: BorderRadius.circular(10)
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: MyColors.colorButton
        ),
        borderRadius: BorderRadius.circular(10)
      ),
      hintStyle: GoogleFonts.manrope(
        fontSize: 14,
      )
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: MyColors.white
    ),
  );
}
