import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:astro_guide/shared/typedef.dart';
import 'package:astro_guide/services/networking/ApiService.dart';

class HoroscopeRepository {
  final ApiService apiService;

  HoroscopeRepository(this.apiService);

  Future<JSON> fetch(String token, String endpoint) async {
    var services = await apiService.get(endpoint: ApiConstants.horoscopeAPI+endpoint, token: token);
    return services;
  }

  Future<JSON> fetchByData(String token, String endpoint, Map<String, dynamic> data) async {
    var services = await apiService.post(endpoint: ApiConstants.horoscopeAPI+endpoint, token: token, body: data);
    return services;
  }

}
