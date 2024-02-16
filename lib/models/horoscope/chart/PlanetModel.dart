import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'PlanetModel.freezed.dart';
part 'PlanetModel.g.dart';


@freezed
class PlanetModel with _$PlanetModel {
  factory PlanetModel({
    required String name,
    required String symbol,
  }) = _PlanetModel;

  factory PlanetModel.fromJson(JSON json) => _$PlanetModelFromJson(json);
}
