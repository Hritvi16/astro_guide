import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:astro_guide/shared/typedef.dart';
import 'package:astro_guide/services/networking/ApiService.dart';

class DashboardRepository {
  final ApiService apiService;

  DashboardRepository(this.apiService);

  Future<JSON> fetch(String token, String endpoint) async {
    var dashboard = await apiService.get(endpoint: ApiConstants.dashboardAPI+endpoint, token: token);
    return dashboard;
  }

  Future<JSON> fetchByID(String token, String endpoint, Map<String, String> data) async {
    var astrologers = await apiService.post(endpoint: ApiConstants.dashboardAPI+endpoint, token: token, body: data);
    return astrologers;
  }
}
