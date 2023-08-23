import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:astro_guide/shared/typedef.dart';
import 'package:astro_guide/services/networking/ApiService.dart';

class SupportRepository {
  final ApiService apiService;

  SupportRepository(this.apiService);

  Future<JSON> fetch(String token, String endpoint) async {
    var supports = await apiService.get(endpoint: ApiConstants.supportAPI+endpoint, token: token);
    return supports;
  }

  Future<JSON> fetchByID(String token, String endpoint, Map<String, dynamic> data) async {
    var supports = await apiService.post(endpoint: ApiConstants.supportAPI+endpoint, body: data, token: token);
    return supports;
  }

}
