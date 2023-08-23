import 'package:get/get_connect/http/src/multipart/form_data.dart';
import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:astro_guide/shared/typedef.dart';
import 'package:astro_guide/services/networking/ApiService.dart';

class MeetingRepository {
  final ApiService apiService;

  MeetingRepository(this.apiService);

  Future<JSON> create(Map<String, dynamic> data, String token) async {
    var update = await apiService.post(endpoint: ApiConstants.meetingAPI+ApiConstants.create, body: data, token: token);
    return update;
  }

  Future<JSON> session(Map<String, String> data, String token) async {
    var update = await apiService.post(endpoint: ApiConstants.meetingAPI+ApiConstants.session, body: data, token: token);
    return update;
  }

  Future<JSON> validate(Map<String, dynamic> data, String token) async {
    var update = await apiService.post(endpoint: ApiConstants.meetingAPI+ApiConstants.validate, body: data, token: token);
    return update;
  }

  Future<JSON> waitlist(Map<String, dynamic> data, String token) async {
    var update = await apiService.post(endpoint: ApiConstants.meetingAPI+ApiConstants.waitlist, body: data, token: token);
    return update;
  }

  Future<JSON> cancel(Map<String, dynamic> data, String token) async {
    var update = await apiService.post(endpoint: ApiConstants.meetingAPI+ApiConstants.cancel, body: data, token: token);
    return update;
  }

  Future<JSON> end(Map<String, dynamic> data, String token) async {
    var update = await apiService.post(endpoint: ApiConstants.meetingAPI+ApiConstants.end, body: data, token: token);
    return update;
  }

  Future<JSON> fetchByID(String token, String endpoint, Map<String, dynamic> data) async {
    var calls = await apiService.post(endpoint: ApiConstants.meetingAPI+endpoint, body: data, token: token);
    return calls;
  }
}
