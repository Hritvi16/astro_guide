import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:astro_guide/shared/typedef.dart';
import 'package:astro_guide/services/networking/ApiService.dart';

class ServiceRepository {
  final ApiService apiService;

  ServiceRepository(this.apiService);

  Future<JSON> fetch(String token, String endpoint) async {
    var services = await apiService.get(endpoint: ApiConstants.serviceAPI+endpoint, token: token);
    return services;
  }

}
