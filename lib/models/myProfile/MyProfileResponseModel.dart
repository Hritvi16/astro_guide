import 'package:astro_guide/models/country/CountryModel.dart';
import 'package:astro_guide/models/setting/SettingModel.dart';
import 'package:astro_guide/models/user/UserModel.dart';
import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'MyProfileResponseModel.freezed.dart';
part 'MyProfileResponseModel.g.dart';

@freezed
class MyProfileResponseModel with _$MyProfileResponseModel {
  factory MyProfileResponseModel({
    required String status,
    required int code,
    required String message,
    UserModel? data,
    List<CountryModel>? countries,
  }) = _MyProfileResponseModel;

  factory MyProfileResponseModel.fromJson(JSON json) => _$MyProfileResponseModelFromJson(json);
}
