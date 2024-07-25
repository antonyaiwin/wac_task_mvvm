import 'package:http/http.dart' as http;
import 'package:wac_task/model/dashboard_data_model/dashboard_data_model.dart';

class DashboardService {
  String baseUrl = 'https://64bfc2a60d8e251fd111630f.mockapi.io/api/Todo';

  Future<List<DashboardDataModel>?> fetchDashboardData() async {
    var response = await http
        .get(Uri.parse(baseUrl))
        .timeout(const Duration(seconds: 100));
    if (response.statusCode == 200) {
      return dashboardDataModelFromResponse(response.body);
    }
    return null;
  }
}
