import 'package:astro_guide/models/horoscope/basic/PayaModel.dart';
import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'PlanetModel.freezed.dart';
part 'PlanetModel.g.dart';


@freezed
class PlanetModel with _$PlanetModel {
  factory PlanetModel({
  required String name,
  required String name_lan,
  required String full_degree,
  required String speed,
  required String is_retro,
  required String is_combusted,
  required String longitude,
  required String sign,
  required int sign_no,
  required String rashi_lord,
  required String nakshatra,
  required int nakshatra_pada,
  required int nakshatra_no,
  required String nakshatra_lord,
  required String sub_lord,
  required String awastha,
  required String karakamsha,
  required int house,
  required String type,
  required String lord_of,
  required String image,
  }) = _PlanetModel;

  factory PlanetModel.fromJson(JSON json) => _$PlanetModelFromJson(json);
}
