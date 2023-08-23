import 'package:astro_guide/models/user/UserModel.dart';
import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'SettingModel.freezed.dart';
part 'SettingModel.g.dart';

@freezed
class SettingModel with _$SettingModel {
  factory SettingModel({
    required String about,
    required String tc,
    required String privacy_policy,
    required String mobile,
    required String email,
    required String address,
    required String link,
  }) = _SettingModel;

  factory SettingModel.fromJson(JSON json) => _$SettingModelFromJson(json);
}
