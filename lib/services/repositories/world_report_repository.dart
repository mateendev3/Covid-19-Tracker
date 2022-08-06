import 'package:flutter/foundation.dart';

import '../../models/world_report.dart';
import '../apis/get_world_report_api.dart';

class WorldReportRepository with ChangeNotifier {
  final GetWorldReportApi _getWorldReportApi = GetWorldReportApi();
  WorldReport? worldReport;
  Future<void> getWorldReport() async {
    worldReport = await _getWorldReportApi.fetchWorldReport();
    notifyListeners();
  }
}
