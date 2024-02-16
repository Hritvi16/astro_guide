import 'package:astro_guide/models/horoscope/basic/BasicKundliModel.dart';
import 'package:astro_guide/models/horoscope/chart/ChartModel.dart';
import 'package:astro_guide/models/horoscope/kp/KPPlanetModel.dart';
import 'package:astro_guide/models/horoscope/planet/PlanetModel.dart';
import 'package:astro_guide/models/horoscope/vimshottari/VimshottariDashaModel.dart';
import 'package:astro_guide/models/horoscope/yogini/YoginiDashaModel.dart';
import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'StorageKundliModel.freezed.dart';
part 'StorageKundliModel.g.dart';


@freezed
class StorageKundliModel with _$StorageKundliModel {
  factory StorageKundliModel({
    required BasicKundliModel basic,
    required List<PlanetModel> planet,
    required List<KPPlanetModel> kpPlanet,
    required VimshottariDashaModel vimshottari,
    required YoginiDashaModel yogini,
    required Map<String, ChartModel> charts,
  }) = _StorageKundliModel;

  factory StorageKundliModel.fromJson(JSON json) => _$StorageKundliModelFromJson(json);
}
