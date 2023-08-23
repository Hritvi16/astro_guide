import 'package:astro_guide/models/meeting/CreateModel.dart';
import 'package:astro_guide/models/meeting/SessionModel.dart';
import 'package:astro_guide/models/response/ResponseModel.dart';
import 'package:astro_guide/models/session/CheckSessionResponseModel.dart';
import 'package:astro_guide/models/session/SessionListModel.dart';
import 'package:astro_guide/models/session/SessionResponseModel.dart';
import 'package:astro_guide/repositories/MeetingRepository.dart';

class MeetingProvider {
  final MeetingRepository meetingRepository;

  MeetingProvider(this.meetingRepository);

  Future<CheckSessionResponseModel> initiate(String token, String endpoint, Map<String, dynamic> body) async {
    var response = await meetingRepository.fetchByID(token, endpoint, body);

    return CheckSessionResponseModel.fromJson(response);
  }

  Future<CreateModel> create(Map<String, dynamic> data, String token) async {
    var createResponse = await meetingRepository.create(data, token);

    return CreateModel.fromJson(createResponse);
  }

  Future<SessionModel> session(Map<String, String> data, String token) async {
    var sessionResponse = await meetingRepository.session(data, token);

    return SessionModel.fromJson(sessionResponse);
  }

  Future<CreateModel> validate(Map<String, dynamic> data, String token) async {
    var response = await meetingRepository.validate(data, token);

    return CreateModel.fromJson(response);
  }

  Future<ResponseModel> waitlist(Map<String, dynamic> data, String token) async {
    var response = await meetingRepository.waitlist(data, token);

    return ResponseModel.fromJson(response);
  }

  Future<SessionModel> cancel(Map<String, dynamic> data, String token) async {
    var sessionResponse = await meetingRepository.cancel(data, token);

    return SessionModel.fromJson(sessionResponse);
  }

  Future<SessionModel> end(Map<String, dynamic> data, String token) async {
    var sessionResponse = await meetingRepository.end(data, token);

    return SessionModel.fromJson(sessionResponse);
  }

  Future<SessionResponseModel> fetchByID(String token, String endpoint, Map<String, dynamic> body) async {
    var sessionResponseModel = await meetingRepository.fetchByID(token, endpoint, body);

    return SessionResponseModel.fromJson(sessionResponseModel);
  }

  Future<ResponseModel> manage(String token, String endpoint, Map<String, dynamic> body) async {
    var response = await meetingRepository.fetchByID(token, endpoint, body);

    return ResponseModel.fromJson(response);
  }
}
