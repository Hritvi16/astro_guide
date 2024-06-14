import 'package:google_fonts/google_fonts.dart';
import 'package:astro_guide/colors/MyColors.dart';
import 'package:flutter/material.dart';

class Themes {
  static ThemeData lightTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    checkboxTheme: const CheckboxThemeData(
      visualDensity: VisualDensity.compact, // Sets density to standard
    ),
    textSelectionTheme: TextSelectionThemeData(
        cursorColor: MyColors.colorButton
    ),
    textTheme: GoogleFonts.latoTextTheme(
        TextTheme(
            displayLarge: GoogleFonts.manrope(
                letterSpacing: -1.5,
                fontSize: 48,
                color: Colors.black,
                fontWeight: FontWeight.bold
            ),
            displayMedium: GoogleFonts.manrope(
                letterSpacing: -1.0,
                fontSize: 40,
                color: Colors.black,
                fontWeight: FontWeight.bold
            ),
            displaySmall: GoogleFonts.manrope(
                letterSpacing: -1.0,
                fontSize: 32,
                color: Colors.black,
                fontWeight: FontWeight.bold
            ),
            headlineMedium: GoogleFonts.manrope(
                letterSpacing: -1.0,
                color: Colors.black,
                fontSize: 28,
                fontWeight: FontWeight.w600
            ),
            headlineSmall: GoogleFonts.manrope(
                letterSpacing: -1.0,
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w500
            ),
            titleLarge: GoogleFonts.manrope(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w500
            ),
            titleMedium: GoogleFonts.manrope(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500
            ),
            titleSmall: GoogleFonts.manrope(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500
            ),
            bodyLarge: GoogleFonts.manrope(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w400
            ),
            bodyMedium: GoogleFonts.manrope(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w400
            ),
            labelLarge: GoogleFonts.manrope(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600
            ),
            bodySmall: GoogleFonts.manrope(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w400
            ),
            labelSmall: GoogleFonts.manrope(
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
    checkboxTheme: const CheckboxThemeData(
      visualDensity: VisualDensity.standard, // Sets density to standard
    ),
    textSelectionTheme: TextSelectionThemeData(
        cursorColor: MyColors.colorButton
    ),
    textTheme: GoogleFonts.latoTextTheme(
        TextTheme(
            displayLarge: GoogleFonts.manrope(
                letterSpacing: -1.5,
                fontSize: 48,
                color: Colors.grey.shade50,
                fontWeight: FontWeight.bold
            ),
            displayMedium: GoogleFonts.manrope(
                letterSpacing: -1.0,
                fontSize: 40,
                color: Colors.grey.shade50,
                fontWeight: FontWeight.bold
            ),
            displaySmall: GoogleFonts.manrope(
                letterSpacing: -1.0,
                fontSize: 32,
                color: Colors.grey.shade50,
                fontWeight: FontWeight.bold
            ),
            headlineMedium: GoogleFonts.manrope(
                letterSpacing: -1.0,
                color: Colors.grey.shade50,
                fontSize: 28,
                fontWeight: FontWeight.w600
            ),
            headlineSmall: GoogleFonts.manrope(
                letterSpacing: -1.0,
                color: Colors.grey.shade50,
                fontSize: 24,
                fontWeight: FontWeight.w500
            ),
            titleLarge: GoogleFonts.manrope(
                color: Colors.grey.shade50,
                fontSize: 18,
                fontWeight: FontWeight.w500
            ),
            titleMedium: GoogleFonts.manrope(
                color: Colors.grey.shade50,
                fontSize: 16,
                fontWeight: FontWeight.w500
            ),
            titleSmall: GoogleFonts.manrope(
                color: Colors.grey.shade50,
                fontSize: 14,
                fontWeight: FontWeight.w500
            ),
            bodyLarge: GoogleFonts.manrope(
                color: Colors.grey.shade50,
                fontSize: 16,
                fontWeight: FontWeight.w400
            ),
            bodyMedium: GoogleFonts.manrope(
                color: Colors.grey.shade50,
                fontSize: 14,
                fontWeight: FontWeight.w400
            ),
            labelLarge: GoogleFonts.manrope(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600
            ),
            bodySmall: GoogleFonts.manrope(
                color: Colors.grey.shade50,
                fontSize: 12,
                fontWeight: FontWeight.w500
            ),
            labelSmall: GoogleFonts.manrope(
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
    ), bottomAppBarTheme: BottomAppBarTheme(color: MyColors.gray900),
  );
}
