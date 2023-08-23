import 'package:get/get_connect/http/src/multipart/form_data.dart';
import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:astro_guide/shared/typedef.dart';
import 'package:astro_guide/services/networking/ApiService.dart';

class UserRepository {
  final ApiService apiService;

  UserRepository(this.apiService);

  Future<JSON> settings(String token, String endpoint) async {
    var response = await apiService.get(endpoint: ApiConstants.userAPI+endpoint, token: token);

    return response;
  }

  Future<JSON> login(Map<String, dynamic> data, String token, String endpoint) async {
    var login = await apiService.post(endpoint: ApiConstants.userAPI+endpoint, body: data, token: token);

    print(login);
    return login;
  }

  Future<JSON> update(Map<String, dynamic> data, String token) async {
    var update = await apiService.post(endpoint: ApiConstants.userAPI+ApiConstants.update, body: data, token: token);

    return update;
  }

  Future<JSON> add(FormData formData, String token) async {
    var image = await apiService.file(endpoint: ApiConstants.userAPI+ApiConstants.add, body: formData, token: token);
    return image;
  }

  Future<JSON> fetch(String token, String endpoint) async {
    var user = await apiService.get(endpoint: ApiConstants.userAPI+endpoint, token: token);
    return user;
  }
}
