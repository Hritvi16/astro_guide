import 'package:astro_guide/models/horoscope/HoroscopeResponseModel.dart';
import 'package:astro_guide/repositories/ServiceRepository.dart';

class ServiceProvider {
  final ServiceRepository serviceRepository;

  ServiceProvider(this.serviceRepository);

  Future<HoroscopeResponseModel> fetchHoroscope(String token, String endpoint) async {
    var horoscopeResponseModel = await serviceRepository.fetch(token, endpoint);

    return HoroscopeResponseModel.fromJson(horoscopeResponseModel);
  }
}
