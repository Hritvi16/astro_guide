import 'package:astro_guide/models/horoscope/planet/PlanetModel.dart';
import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'PlanetTableModel.freezed.dart';
part 'PlanetTableModel.g.dart';


@freezed
class PlanetTableModel with _$PlanetTableModel {
  factory PlanetTableModel({
  required String date,
  required String time,
  required String latitude,
  required String longitude,
  required String timezone,
  required List<PlanetModel> planets,
  }) = _PlanetTableModel;

  factory PlanetTableModel.fromJson(JSON json) => _$PlanetTableModelFromJson(json);
}
