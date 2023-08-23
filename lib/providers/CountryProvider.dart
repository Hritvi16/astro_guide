import 'package:astro_guide/models/country/CountryListModel.dart';
import 'package:astro_guide/repositories/CountryRepository.dart';

class CountryProvider {
  final CountryRepository countryRepository;

  CountryProvider(this.countryRepository);

  Future<CountryListModel> fetchList(String token) async {
    var countryListResponse = await countryRepository.getCountries(token);

    return CountryListModel.fromJson(countryListResponse);
  }

}
