import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:astro_guide/shared/typedef.dart';
import 'package:astro_guide/services/networking/ApiService.dart';
import 'package:get/get.dart';

class ChatRepository {
  final ApiService apiService;

  ChatRepository(this.apiService);

  Future<JSON> fetch(String token, String endpoint) async {
    var chats = await apiService.get(endpoint: ApiConstants.chatAPI+endpoint, token: token);
    return chats;
  }

  Future<JSON> fetchByID(String token, String endpoint, Map<String, dynamic> data) async {
    var chats = await apiService.post(endpoint: ApiConstants.chatAPI+endpoint, body: data, token: token);
    return chats;
  }

  Future<JSON> send(FormData formData, String token) async {
    var image = await apiService.file(endpoint: ApiConstants.chatAPI+ApiConstants.upload, body: formData, token: token);
    return image;
  }
}
