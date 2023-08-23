import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:astro_guide/shared/typedef.dart';
import 'package:astro_guide/services/networking/ApiService.dart';

class CityRepository {
  final ApiService apiService;

  CityRepository(this.apiService);

  Future<JSON> getCities(Map<String, dynamic> data, String endpoint, String token) async {
    var cities = await apiService.post(endpoint: ApiConstants.cityAPI+endpoint, body: data, token: token);
    return cities;
  }

}
