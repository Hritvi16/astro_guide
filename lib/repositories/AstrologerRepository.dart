import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:astro_guide/shared/typedef.dart';
import 'package:astro_guide/services/networking/ApiService.dart';

class AstrologerRepository {
  final ApiService apiService;

  AstrologerRepository(this.apiService);

  Future<JSON> fetch(String token, String endpoint) async {
    var astrologers = await apiService.get(endpoint: ApiConstants.astrologerAPI+endpoint, token: token);
    return astrologers;
  }

  Future<JSON> fetchByID(String token, String endpoint, Map<String, String> data) async {
    var astrologers = await apiService.post(endpoint: ApiConstants.astrologerAPI+endpoint, token: token, body: data);
    return astrologers;
  }

  Future<JSON> add(String token, String endpoint, Map<String, String> data) async {
    var response = await apiService.post(endpoint: endpoint, token: token, body: data);
    return response;
  }

}
