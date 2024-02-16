import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

Future<String> fetchToken() async {
  // if (!dotenv.isInitialized) {
  //   // Load Environment variables
  //   await dotenv.load(fileName: ".env");
  // }
  // final String? _AUTH_URL = dotenv.env['AUTH_URL'];
  // String? _AUTH_TOKEN = dotenv.env['AUTH_TOKEN'];
  //
  // if ((_AUTH_TOKEN?.isEmpty ?? true) && (_AUTH_URL?.isEmpty ?? true)) {
  //   showSnackBarMessage(
  //       message: "Please set the environment variables", context: context);
  //   throw Exception("Either AUTH_TOKEN or AUTH_URL is not set in .env file");
  // }
  //
  // if ((_AUTH_TOKEN?.isNotEmpty ?? false) && (_AUTH_URL?.isNotEmpty ?? false)) {
  //   showSnackBarMessage(
  //       message: "Please set only one environment variable", context: context);
  //   throw Exception("Either AUTH_TOKEN or AUTH_URL can be set in .env file");
  // }

  final String? _AUTH_URL = "http://192.168.1.3:9001";
  String? _AUTH_TOKEN = "";
  final Uri getTokenUrl = Uri.parse('$_AUTH_URL/get-token');
  print(getTokenUrl);
  final http.Response tokenResponse = await http.get(getTokenUrl);
  _AUTH_TOKEN = json.decode(tokenResponse.body)['token'];
  return _AUTH_TOKEN ?? "";
}

Future<String> createMeeting(String _token) async {
  final String? _VIDEOSDK_API_ENDPOINT = "http://192.168.1.3:9001";
  final Uri getMeetingIdUrl =
      Uri.parse('$_VIDEOSDK_API_ENDPOINT/create-meeting/');

  final http.Response meetingIdResponse =
      await http.post(getMeetingIdUrl, body: {"token": _token});

  print(meetingIdResponse.body);
  if (meetingIdResponse.statusCode != 200) {
    throw Exception(json.decode(meetingIdResponse.body)["error"]);
  }
  var _meetingID = json.decode(meetingIdResponse.body)['roomId'];
  return _meetingID;
}

Future<bool> validateMeeting(String token, String meetingId) async {
  //final String? _VIDEOSDK_API_ENDPOINT = "https://api.videosdk.live/v2";
  final String? _VIDEOSDK_API_ENDPOINT = "http://192.168.1.3:9001";

  final Uri validateMeetingUrl =
      Uri.parse('$_VIDEOSDK_API_ENDPOINT/rooms/validate/');
  final http.Response validateMeetingResponse = await http
      .post(validateMeetingUrl, body: {"token": token, "meetingId": meetingId});

  if (validateMeetingResponse.statusCode != 200) {
    throw Exception(json.decode(validateMeetingResponse.body)["error"]);
  }

  return validateMeetingResponse.statusCode == 200;
}

Future<dynamic> fetchSession(String token, String meetingId) async {
  final String? _VIDEOSDK_API_ENDPOINT = "http://192.168.1.3:9001";
  //final String? _VIDEOSDK_API_ENDPOINT = "https://api.videosdk.live/v2";

  final Uri getMeetingIdUrl =
      Uri.parse('$_VIDEOSDK_API_ENDPOINT/sessions/validate/');
  final http.Response validateMeetingResponse = await http
      .post(getMeetingIdUrl, body: {"token": token, "meetingId": meetingId});

  List<dynamic> sessions = jsonDecode(validateMeetingResponse.body)['data'];
  return sessions.first;
}
