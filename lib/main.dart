import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/search_country_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/world_stats_screen.dart';
import 'services/repositories/countries_report_repository.dart';
import 'services/repositories/world_report_repository.dart';
import 'utils/constants.dart';
import 'utils/theme_constants.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<WorldReportRepository>(
        create: (_) => WorldReportRepository(),
      ),
      ChangeNotifierProvider<CountriesReportRepository>(
        create: (_) => CountriesReportRepository(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid-19 Tracker',
      debugShowCheckedModeBanner: false,
      theme: covidTheme,
      routes: {
        MyRoutes.kHome: (_) => const WorldStatsScreen(),
        MyRoutes.kSplashScreen: (_) => const SplashScreen(),
        MyRoutes.kSearchCountryScreen: (_) => const SearchCountryScreen(),
      },
      initialRoute: MyRoutes.kSplashScreen,
    );
  }
}
