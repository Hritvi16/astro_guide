import 'package:astro_guide/models/horoscope/kp/KPPlanetModel.dart';
import 'package:astro_guide/models/horoscope/basic/PayaModel.dart';
import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'KPPlanetTableModel.freezed.dart';
part 'KPPlanetTableModel.g.dart';


@freezed
class KPPlanetTableModel with _$KPPlanetTableModel {
  factory KPPlanetTableModel({
  required List<KPPlanetModel> table_data,
  }) = _KPPlanetTableModel;

  factory KPPlanetTableModel.fromJson(JSON json) => _$KPPlanetTableModelFromJson(json);
}
