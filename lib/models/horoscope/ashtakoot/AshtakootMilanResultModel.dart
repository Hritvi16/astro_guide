import 'package:astro_guide/models/horoscope/basic/PayaModel.dart';
import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'AshtakootMilanResultModel.freezed.dart';
part 'AshtakootMilanResultModel.g.dart';


@freezed
class AshtakootMilanResultModel with _$AshtakootMilanResultModel {
  factory AshtakootMilanResultModel({
  required double points_obtained,
  required double max_ponits,
  required String is_compatible,
  required String content,
  }) = _AshtakootMilanResultModel;

  factory AshtakootMilanResultModel.fromJson(JSON json) => _$AshtakootMilanResultModelFromJson(json);
}
