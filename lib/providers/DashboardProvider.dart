import 'package:astro_guide/models/dashboard/DashboardModel.dart';
import 'package:astro_guide/repositories/DashboardRepository.dart';

class DashboardProvider {
  final DashboardRepository dashboardRepository;

  DashboardProvider(this.dashboardRepository);

  Future<DashboardModel> fetch(String token, String endpoint) async {
    var dashboardResponse = await dashboardRepository.fetch(token, endpoint);

    return DashboardModel.fromJson(dashboardResponse);
  }

  Future<DashboardModel> fetchByID(String token, String endpoint, Map<String, String> data) async {
    var dashboardResponse = await dashboardRepository.fetchByID(token, endpoint, data);

    return DashboardModel.fromJson(dashboardResponse);
  }
}
