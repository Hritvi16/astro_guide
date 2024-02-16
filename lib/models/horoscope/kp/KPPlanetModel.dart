import 'package:astro_guide/models/horoscope/basic/PayaModel.dart';
import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'KPPlanetModel.freezed.dart';
part 'KPPlanetModel.g.dart';


@freezed
class KPPlanetModel with _$KPPlanetModel {
  factory KPPlanetModel({
  required String planet,
  required int planet_in,
  required String planet_owns,
  required String nakshatra_lord,
  required int nakshatra_lord_in,
  required String nakshatra_lord_owns,
  required String sub_lord,
  required int sub_lord_in,
  required String sub_lord_owns,
  required String sub_sub_lord,
  required int sub_sub_lord_in,
  required String sub_sub_lord_owns,
  }) = _KPPlanetModel;

  factory KPPlanetModel.fromJson(JSON json) => _$KPPlanetModelFromJson(json);
}
