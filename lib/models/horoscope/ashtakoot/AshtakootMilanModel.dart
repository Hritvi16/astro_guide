import 'package:astro_guide/models/horoscope/basic/PayaModel.dart';
import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'AshtakootMilanModel.freezed.dart';
part 'AshtakootMilanModel.g.dart';


@freezed
class AshtakootMilanModel with _$AshtakootMilanModel {
  factory AshtakootMilanModel({
  required String p1,
  required String p2,
  required double points_obtained,
  required double max_ponits,
  required String area_of_life,
  }) = _AshtakootMilanModel;

  factory AshtakootMilanModel.fromJson(JSON json) => _$AshtakootMilanModelFromJson(json);
}
