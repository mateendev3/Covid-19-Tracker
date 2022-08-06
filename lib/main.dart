import 'package:flutter/material.dart';

import 'screens/splash_screen.dart';
import 'utils/theme_constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid-19 Tracker',
      debugShowCheckedModeBanner: false,
      theme: covidTheme,
      home: const SplashScreen(),
    );
  }
}
