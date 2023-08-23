import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:astro_guide/shared/typedef.dart';
import 'package:astro_guide/services/networking/ApiService.dart';

class CountryRepository {
  final ApiService apiService;

  CountryRepository(this.apiService);

  Future<JSON> getCountries(String token) async {
    var countries = await apiService.get(endpoint: ApiConstants.countryAPI+ApiConstants.all, token: token);
    return countries;
  }

}
