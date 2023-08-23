import 'package:astro_guide/models/response/ResponseModel.dart';
import 'package:astro_guide/models/support/SupportChatListModel.dart';
import 'package:astro_guide/models/support/SupportListModel.dart';
import 'package:astro_guide/models/support/SupportResponseModel.dart';
import 'package:astro_guide/repositories/SupportRepository.dart';

class SupportProvider {
  final SupportRepository supportRepository;

  SupportProvider(this.supportRepository);

  Future<SupportListModel> fetch(String token, String endpoint) async {
    var supportListResponse = await supportRepository.fetch(token, endpoint);

    return SupportListModel.fromJson(supportListResponse);
  }

  Future<SupportChatListModel> fetchByID(String token, String endpoint) async {
    var supportChatListResponse = await supportRepository.fetch(token, endpoint);

    return SupportChatListModel.fromJson(supportChatListResponse);
  }

  Future<SupportResponseModel> request(String token, String endpoint, Map<String, dynamic> body) async {
    var response = await supportRepository.fetchByID(token, endpoint, body);

    return SupportResponseModel.fromJson(response);
  }


  // Future<SupportResponseModel> send(String token, String endpoint, Map<String, dynamic> body) async {
  //   var supportResponse = await supportRepository.fetchByID(token, endpoint, body);
  //
  //   return SupportResponseModel.fromJson(supportResponse);
  // }
  //
  Future<ResponseModel> manage(String token, String endpoint, Map<String, dynamic> body) async {
    var response = await supportRepository.fetchByID(token, endpoint, body);

    return ResponseModel.fromJson(response);
  }
}
