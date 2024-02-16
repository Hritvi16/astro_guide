import 'package:astro_guide/models/horoscope/chart/ChartDataModel.dart';
import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ChartModel.freezed.dart';
part 'ChartModel.g.dart';


@freezed
class ChartModel with _$ChartModel {
  factory ChartModel({
  required String svg,
  required String base64_image,
  required Map<String, ChartDataModel> data,
  }) = _ChartModel;

  factory ChartModel.fromJson(JSON json) => _$ChartModelFromJson(json);
}
