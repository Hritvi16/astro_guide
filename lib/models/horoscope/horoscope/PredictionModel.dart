import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'PredictionModel.freezed.dart';
part 'PredictionModel.g.dart';


@freezed
class PredictionModel with _$PredictionModel {
  factory PredictionModel({
    required String personal,
    required String health,
    required String profession,
    required String emotions,
    required String travel,
    required List<String> luck,
  }) = _PredictionModel;

  factory PredictionModel.fromJson(JSON json) => _$PredictionModelFromJson(json);
}
