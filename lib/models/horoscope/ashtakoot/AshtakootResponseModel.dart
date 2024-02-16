import 'package:astro_guide/models/horoscope/ashtakoot/AshtakootModel.dart';
import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'AshtakootResponseModel.freezed.dart';
part 'AshtakootResponseModel.g.dart';


@freezed
class AshtakootResponseModel with _$AshtakootResponseModel {
  factory AshtakootResponseModel({
    required String status,
    required int code,
    required String message,
    AshtakootModel? data,
  }) = _AshtakootResponseModel;

  factory AshtakootResponseModel.fromJson(JSON json) => _$AshtakootResponseModelFromJson(json);
}

