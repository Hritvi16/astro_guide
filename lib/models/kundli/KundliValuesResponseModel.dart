import 'package:astro_guide/models/city/CityModel.dart';
import 'package:astro_guide/models/kundli/KundliModel.dart';
import 'package:astro_guide/models/relation/RelationModel.dart';
import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'KundliValuesResponseModel.freezed.dart';
part 'KundliValuesResponseModel.g.dart';


@freezed
class KundliValuesResponseModel with _$KundliValuesResponseModel {
  factory KundliValuesResponseModel({
    required String status,
    required int code,
    required String message,
    List<CityModel>? cities,
    List<RelationModel>? relations,
  }) = _KundliValuesResponseModel;

  factory KundliValuesResponseModel.fromJson(JSON json) => _$KundliValuesResponseModelFromJson(json);
}

