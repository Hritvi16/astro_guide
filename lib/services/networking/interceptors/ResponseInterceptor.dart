import 'dart:async';
import 'package:get/get_connect.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:astro_guide/shared/widgets/CommonWidgets.dart';

FutureOr<dynamic> responseInterceptor(Request request, Response response) async {
  return handleResponse(response);
}

dynamic handleResponse(response) {

  switch (response.statusCode) {
    case 200:
    case 401:
    case 403:
      return response;
    default:
      // CommonWidgets.snackBar('error',
      //     'Error accrued while fetching data. : ${response.statusCode}');
      throw UnknownException(
          'Error accrued while fetching data. : ${response.statusCode}');
  }
}

class AppException implements Exception {
  final code;
  final message;
  final details;

  AppException({this.code, this.message, this.details});

  String toString() {
    return "[$code]: $message \n $details";
  }
}

class UnknownException extends AppException {
  UnknownException(String message) : super(code: 010, message: message);
}
