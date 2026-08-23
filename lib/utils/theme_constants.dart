import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';

final ThemeData covidTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.black,
  colorScheme: _getCustomColorScheme(),
  textTheme: _getTextTheme(),
  scaffoldBackgroundColor: MyColors.kPorcelain,
  appBarTheme: _getAppBarTheme(),
);

AppBarTheme _getAppBarTheme() {
  return AppBarTheme(
    elevation: 0.0,
    shadowColor: Colors.transparent,
    titleTextStyle: GoogleFonts.playfairDisplay(
      color: MyColors.kCodGray,
      fontSize: 40.0,
      fontWeight: FontWeight.w500,
    ),
  );
}

TextTheme _getTextTheme() {
  return TextTheme(
    displayMedium: GoogleFonts.playfairDisplay(
      color: MyColors.kCodGray,
      fontSize: 40.0,
      fontWeight: FontWeight.w600,
    ),
    displaySmall: GoogleFonts.poppins(
      color: MyColors.kCodGray,
      fontSize: 22.0,
    ),
    headlineMedium: GoogleFonts.poppins(
      color: MyColors.kCodGray,
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
    ),
    titleLarge: GoogleFonts.poppins(
      color: MyColors.kRollingStone,
      fontSize: 16.0,
    ),
    bodySmall: GoogleFonts.poppins(
      color: MyColors.kCodGray,
      fontWeight: FontWeight.w500,
      fontSize: 14.0,
    ),
  );
}

ColorScheme _getCustomColorScheme() {
  return const ColorScheme.light(
    primary: MyColors.kPorcelain,
    onPrimary: MyColors.kCodGray,
    onError: Colors.redAccent,
    surface: MyColors.kPorcelain,
  );
}
