import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'LoginModel.freezed.dart';
part 'LoginModel.g.dart';

@freezed
class LoginModel with _$LoginModel {
  factory LoginModel({
    required int code,
    required String status,
    required String message,
    String? access_token,
    String? refresh_token,
  }) = _LoginModel;

  factory LoginModel.fromJson(JSON json) => _$LoginModelFromJson(json);
}
