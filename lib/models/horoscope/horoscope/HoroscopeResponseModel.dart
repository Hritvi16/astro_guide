import 'package:astro_guide/models/horoscope/horoscope/HoroscopeModel.dart';
import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'HoroscopeResponseModel.freezed.dart';
part 'HoroscopeResponseModel.g.dart';


@freezed
class HoroscopeResponseModel with _$HoroscopeResponseModel {
  factory HoroscopeResponseModel({
    required String status,
    required int code,
    required String message,
    HoroscopeModel? data,
  }) = _HoroscopeResponseModel;

  factory HoroscopeResponseModel.fromJson(JSON json) => _$HoroscopeResponseModelFromJson(json);
}

