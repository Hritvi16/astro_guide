import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'CountryModel.freezed.dart';
part 'CountryModel.g.dart';


@freezed
class CountryModel with _$CountryModel {
  factory CountryModel({
    required int id,
    required String name,
    required String nationality,
    required String icon,
    required String code,
    required String imageFullUrl,
  }) = _CountryModel;

  factory CountryModel.fromJson(JSON json) => _$CountryModelFromJson(json);
}
