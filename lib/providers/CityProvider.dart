import 'package:astro_guide/models/City/CityListModel.dart';
import 'package:astro_guide/repositories/CityRepository.dart';

class CityProvider {
  final CityRepository cityRepository;

  CityProvider(this.cityRepository);

  Future<CityListModel> fetchList(Map<String, dynamic> data, String endpoint, String token) async {
    var cityListResponse = await cityRepository.getCities(data, endpoint, token);

    return CityListModel.fromJson(cityListResponse);
  }

}
