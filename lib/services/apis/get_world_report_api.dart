import 'package:http/http.dart' as http;

import '../../models/world_report.dart';
import '../../utils/constants.dart';

class GetWorldReportApi {
  final _uri =
      Uri.parse('${ApiConstants.kBaseUrl}${ApiConstants.kAllEndPoint}');

  // method to fetch report
  Future<WorldReport> fetchWorldReport() async {
    try {
      //sending http request
      http.Response response = await http.get(_uri);

      if (response.statusCode == 200) {
        WorldReport report = WorldReport.fromJson(response.body);
        return report;
      } else {
        throw 'Something went wrong';
      }
    } catch (error) {
      throw error.toString();
    }
  }
}
