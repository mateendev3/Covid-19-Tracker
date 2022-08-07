import 'package:flutter/material.dart';

class MyColors {
  static const kPorcelain = Color(0xFFE6E9Eb);
  static const kLoblollyLight = Color.fromARGB(255, 206, 210, 215);
  static const kLoblolly = Color(0xFFbCC2C9);
  static const kRollingStone = Color(0xFF7C8186);
  static const kDoveGray = Color(0xFF626262);
  static const kCodGray = Color(0xFF090909);
  static const kBlack = Colors.black;
  static const kWhite = Colors.white;
}

class ApiConstants {
  static const kBaseUrl = 'https://disease.sh/v3/covid-19';
  static const kAllEndPoint = '/all';
  static const kCountriesEndPoint = '/countries';
}

class MyRoutes {
  static const String kHome = '/home';
  static const String kSplashScreen = '/';
  static const String kMasterCountryScreen = '/master-country';
  static const String kSearchCountryScreen = '/search-country';
}
