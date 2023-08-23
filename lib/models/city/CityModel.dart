import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'CityModel.freezed.dart';
part 'CityModel.g.dart';


@freezed
class CityModel with _$CityModel {
  factory CityModel({
    required int id,
    required String name,
    required int st_id,
    String? state,
    String? country,
  }) = _CityModel;

  factory CityModel.fromJson(JSON json) => _$CityModelFromJson(json);
}
