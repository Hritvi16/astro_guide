import 'package:astro_guide/models/horoscope/basic/BasicKundliModel.dart';
import 'package:astro_guide/models/horoscope/chart/ChartModel.dart';
import 'package:astro_guide/models/horoscope/kp/KPPlanetTableModel.dart';
import 'package:astro_guide/models/horoscope/planet/PlanetTableModel.dart';
import 'package:astro_guide/models/horoscope/vimshottari/VimshottariDashaModel.dart';
import 'package:astro_guide/models/horoscope/yogini/YoginiDashaModel.dart';
import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'KundliDetailModel.freezed.dart';
part 'KundliDetailModel.g.dart';


@freezed
class KundliDetailModel with _$KundliDetailModel {
  factory KundliDetailModel({
    required BasicKundliModel basic,
    required Map<String, ChartModel> charts,
    // required ChartModel d60,
    required YoginiDashaModel yogini,
    required VimshottariDashaModel vimshottari,
    required PlanetTableModel planet,
    required KPPlanetTableModel kpPlanet,
  }) = _KundliDetailModel;

  factory KundliDetailModel.fromJson(JSON json) => _$KundliDetailModelFromJson(json);
}

