import 'package:astro_guide/models/myProfile/MyProfileResponseModel.dart';
import 'package:astro_guide/models/setting/SettingResponseModel.dart';
import 'package:get/get_connect/http/src/multipart/form_data.dart';
import 'package:astro_guide/models/login/LoginModel.dart';
import 'package:astro_guide/models/response/ResponseModel.dart';
import 'package:astro_guide/repositories/UserRepository.dart';

class UserProvider {
  final UserRepository userRepository;

  UserProvider(this.userRepository);

  Future<SettingResponseModel> settings(String token, String endpoint) async {
    var settingResponseModel = await userRepository.settings(token, endpoint);

    return SettingResponseModel.fromJson(settingResponseModel);
  }

  Future<LoginModel> login(Map<String, dynamic> data, String token, String endpoint) async {
    var loginResponse = await userRepository.login(data, token, endpoint);

    return LoginModel.fromJson(loginResponse);
  }

  Future<ResponseModel> update(Map<String, dynamic> data, String token, String endpoint) async {
    var response = await userRepository.update(data, token, endpoint);

    return ResponseModel.fromJson(response);
  }

  Future<LoginModel> add(FormData formData, String endpoint, String token) async {
    var loginResponse = await userRepository.add(formData, endpoint, token);

    return LoginModel.fromJson(loginResponse);
  }

  Future<MyProfileResponseModel> fetchSingle(String token, String endpoint) async {
    var myProfileResponseModel = await userRepository.fetch(token, endpoint);

    return MyProfileResponseModel.fromJson(myProfileResponseModel);
  }

}
