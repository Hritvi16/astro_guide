import 'package:astro_guide/models/horoscope/KundliResponseModel.dart';
import 'package:astro_guide/models/horoscope/ashtakoot/AshtakootResponseModel.dart';
import 'package:astro_guide/models/horoscope/basic/BasicKundliResponseModel.dart';
import 'package:astro_guide/models/horoscope/chart/ChartResponseModel.dart';
import 'package:astro_guide/models/horoscope/horoscope/HoroscopeResponseModel.dart';
import 'package:astro_guide/models/horoscope/kp/KPPlanetResponseModel.dart';
import 'package:astro_guide/models/horoscope/planet/PlanetResponseModel.dart';
import 'package:astro_guide/models/horoscope/vimshottari/VimshottariDashaResponseModel.dart';
import 'package:astro_guide/models/horoscope/yogini/YoginiDashaResponseModel.dart';
import 'package:astro_guide/repositories/HoroscopeRepository.dart';

class HoroscopeProvider {
  final HoroscopeRepository horoscopeRepository;

  HoroscopeProvider(this.horoscopeRepository);

  Future<HoroscopeResponseModel> fetchHoroscope(String token, String endpoint, Map<String, dynamic> data) async {
    var horoscopeResponseModel = await horoscopeRepository.fetchByData(token, endpoint, data);

    return HoroscopeResponseModel.fromJson(horoscopeResponseModel);
  }

  Future<KundliResponseModel> fetchKundli(String token, String endpoint, Map<String, dynamic> data) async {
    var kundliResponseModel = await horoscopeRepository.fetchByData(token, endpoint, data);

    return KundliResponseModel.fromJson(kundliResponseModel);
  }

  Future<BasicKundliResponseModel> fetchBasicKundli(String token, String endpoint, Map<String, dynamic> data) async {
    var basicKundliResponseModel = await horoscopeRepository.fetchByData(token, endpoint, data);

    return BasicKundliResponseModel.fromJson(basicKundliResponseModel);
  }

  Future<ChartResponseModel> fetchCharts(String token, String endpoint, Map<String, dynamic> data) async {
    var chartResponseModel = await horoscopeRepository.fetchByData(token, endpoint, data);

    return ChartResponseModel.fromJson(chartResponseModel);
  }

  Future<PlanetResponseModel> fetchPlanetKundli(String token, String endpoint, Map<String, dynamic> data) async {
    var planetResponseModel = await horoscopeRepository.fetchByData(token, endpoint, data);

    return PlanetResponseModel.fromJson(planetResponseModel);
  }

  Future<KPPlanetResponseModel> fetchKPPlanetKundli(String token, String endpoint, Map<String, dynamic> data) async {
    var kPPlanetResponseModel = await horoscopeRepository.fetchByData(token, endpoint, data);

    return KPPlanetResponseModel.fromJson(kPPlanetResponseModel);
  }

  Future<VimshottariDashaResponseModel> fetchVimshottariDasha(String token, String endpoint, Map<String, dynamic> data) async {
    var vimshottariDashaResponseModel = await horoscopeRepository.fetchByData(token, endpoint, data);

    return VimshottariDashaResponseModel.fromJson(vimshottariDashaResponseModel);
  }

  Future<YoginiDashaResponseModel> fetchYoginiDasha(String token, String endpoint, Map<String, dynamic> data) async {
    var yoginiDashaResponseModel = await horoscopeRepository.fetchByData(token, endpoint, data);

    return YoginiDashaResponseModel.fromJson(yoginiDashaResponseModel);
  }

  Future<AshtakootResponseModel> fetchAshtakoot(String token, String endpoint, Map<String, dynamic> data) async {
    var ashtakootResponseModel = await horoscopeRepository.fetchByData(token, endpoint, data);

    return AshtakootResponseModel.fromJson(ashtakootResponseModel);
  }
}
