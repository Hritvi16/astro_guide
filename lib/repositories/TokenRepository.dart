import 'package:get/get_connect/http/src/multipart/form_data.dart';
import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:astro_guide/shared/typedef.dart';
import 'package:astro_guide/services/networking/ApiService.dart';

class TokenRepository {
  final ApiService apiService;

  TokenRepository(this.apiService);

  Future<JSON> access(Map<String, dynamic> data, String token) async {
    var update = await apiService.post(endpoint: ApiConstants.refreshAPI+ApiConstants.access, body: data, token: token);

    return update;
  }

}
