import 'package:astro_guide/models/chat/ChatResponseModel.dart';
import 'package:astro_guide/models/session/CheckSessionResponseModel.dart';
import 'package:astro_guide/models/session/SessionListModel.dart';
import 'package:astro_guide/models/response/ResponseModel.dart';
import 'package:astro_guide/models/chat/ChatModel.dart';
import 'package:astro_guide/models/session/SessionListModel.dart';
import 'package:astro_guide/repositories/ChatRepository.dart';
import 'package:get/get.dart';

class ChatProvider {
  final ChatRepository chatRepository;

  ChatProvider(this.chatRepository);

  Future<SessionListModel> fetch(String token, String endpoint) async {
    var sessionList = await chatRepository.fetch(token, endpoint);

    return SessionListModel.fromJson(sessionList);
  }

  Future<SessionListModel> fetchByID(String token, String endpoint, Map<String, dynamic> body) async {
    var sessionListModel = await chatRepository.fetchByID(token, endpoint, body);

    return SessionListModel.fromJson(sessionListModel);
  }

  Future<CheckSessionResponseModel> check(String token, String endpoint, Map<String, dynamic> body) async {
    var checkSessionResponse = await chatRepository.fetchByID(token, endpoint, body);

    return CheckSessionResponseModel.fromJson(checkSessionResponse);
  }

  Future<CheckSessionResponseModel> initiate(String token, String endpoint, Map<String, dynamic> body) async {
    var response = await chatRepository.fetchByID(token, endpoint, body);

    return CheckSessionResponseModel.fromJson(response);
  }

  Future<ChatResponseModel> send(FormData formData, String token) async {
    var chatResponse = await chatRepository.send(formData, token);

    return ChatResponseModel.fromJson(chatResponse);
  }

  Future<ResponseModel> manage(String token, String endpoint, Map<String, dynamic> body) async {
    var response = await chatRepository.fetchByID(token, endpoint, body);

    return ResponseModel.fromJson(response);
  }

}
