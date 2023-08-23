import 'package:astro_guide/models/setting/SettingModel.dart';
import 'package:astro_guide/models/user/UserModel.dart';
import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'SettingResponseModel.freezed.dart';
part 'SettingResponseModel.g.dart';

@freezed
class SettingResponseModel with _$SettingResponseModel {
  factory SettingResponseModel({
    required String status,
    required int code,
    required String message,
    SettingModel? data,
    UserModel? user
  }) = _SettingResponseModel;

  factory SettingResponseModel.fromJson(JSON json) => _$SettingResponseModelFromJson(json);
}
