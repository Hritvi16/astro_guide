import 'package:astro_guide/models/horoscope/kp/KPPlanetModel.dart';
import 'package:astro_guide/models/horoscope/kp/KPPlanetModel.dart';
import 'package:astro_guide/models/horoscope/kp/KPPlanetTableModel.dart';
import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'KPPlanetResponseModel.freezed.dart';
part 'KPPlanetResponseModel.g.dart';


@freezed
class KPPlanetResponseModel with _$KPPlanetResponseModel {
  factory KPPlanetResponseModel({
    required String status,
    required int code,
    required String message,
    KPPlanetTableModel? data,
  }) = _KPPlanetResponseModel;

  factory KPPlanetResponseModel.fromJson(JSON json) => _$KPPlanetResponseModelFromJson(json);
}

