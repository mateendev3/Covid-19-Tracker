import 'package:flutter/material.dart';

class MyColors {
  static const kPorcelainColor = Color(0xFFE6E9Eb);
  static const kLoblollyLightColor = Color.fromARGB(255, 206, 210, 215);
  static const kLoblollyColor = Color(0xFFbCC2C9);
  static const kRollingStoneColor = Color(0xFF7C8186);
  static const kDoveGrayColor = Color(0xFF626262);
  static const kCodGrayColor = Color(0xFF090909);
  static const kBlack = Colors.black;
  static const kWhite = Colors.white;
}

class ApiConstants {
  static const kBaseUrl = 'https://disease.sh/v3/covid-19';
  static const kAllEndPoint = '/all';
  static const kCountriesEndPoint = '/countries';
}
