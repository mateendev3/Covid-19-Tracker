import 'package:flutter/foundation.dart';

import '../../models/country_report.dart';
import '../apis/get_countries_report_api.dart';

class CountriesReportRepository with ChangeNotifier {
  final GetCountriesReportApi _getCountriesReportApi = GetCountriesReportApi();
  List<CountryReport>? countriesReportList;
  Future<void> getCountriesReport() async {
    countriesReportList = await _getCountriesReportApi.fetchCountriesReport();
    notifyListeners();
  }
}
