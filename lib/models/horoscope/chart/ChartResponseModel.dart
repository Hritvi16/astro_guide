import 'package:astro_guide/models/horoscope/chart/ChartModel.dart';
import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ChartResponseModel.freezed.dart';
part 'ChartResponseModel.g.dart';


@freezed
class ChartResponseModel with _$ChartResponseModel {
  factory ChartResponseModel({
    required String status,
    required int code,
    required String message,
    ChartModel? data,
  }) = _ChartResponseModel;

  factory ChartResponseModel.fromJson(JSON json) => _$ChartResponseModelFromJson(json);
}

