import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';

final ThemeData covidTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.black,
  colorScheme: _getCustomColorScheme(),
  textTheme: _getTextTheme(),
  scaffoldBackgroundColor: MyColors.kPorcelainColor,
  appBarTheme: _getAppBarTheme(),
);

AppBarTheme _getAppBarTheme() {
  return AppBarTheme(
    elevation: 0.0,
    shadowColor: Colors.transparent,
    titleTextStyle: GoogleFonts.playfairDisplay(
      color: MyColors.kCodGrayColor,
      fontSize: 40.0,
      fontWeight: FontWeight.w500,
    ),
  );
}

TextTheme _getTextTheme() {
  return TextTheme(
    headline2: GoogleFonts.playfairDisplay(
      color: MyColors.kCodGrayColor,
      fontSize: 40.0,
      fontWeight: FontWeight.w600,
    ),
    headline3: GoogleFonts.poppins(
      color: MyColors.kCodGrayColor,
      fontSize: 22.0,
    ),
    headline4: GoogleFonts.poppins(
      color: MyColors.kCodGrayColor,
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
    ),
    headline6: GoogleFonts.poppins(
      color: MyColors.kRollingStoneColor,
      fontSize: 16.0,
    ),
    caption: GoogleFonts.poppins(
      color: MyColors.kCodGrayColor,
      fontWeight: FontWeight.w500,
      fontSize: 14.0,
    ),
  );
}

ColorScheme _getCustomColorScheme() {
  return const ColorScheme.light(
    primary: MyColors.kPorcelainColor,
    onPrimary: MyColors.kCodGrayColor,
    onError: Colors.redAccent,
    background: MyColors.kPorcelainColor,
  );
}
