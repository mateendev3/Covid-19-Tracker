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
    headline2: GoogleFonts.playfairDisplay(
      color: MyColors.kCodGray,
      fontSize: 40.0,
      fontWeight: FontWeight.w600,
    ),
    headline3: GoogleFonts.poppins(
      color: MyColors.kCodGray,
      fontSize: 22.0,
    ),
    headline4: GoogleFonts.poppins(
      color: MyColors.kCodGray,
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
    ),
    headline6: GoogleFonts.poppins(
      color: MyColors.kRollingStone,
      fontSize: 16.0,
    ),
    caption: GoogleFonts.poppins(
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
    background: MyColors.kPorcelain,
  );
}
