import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'PayaModel.freezed.dart';
part 'PayaModel.g.dart';


@freezed
class PayaModel with _$PayaModel {
  factory PayaModel({
  required String type,
  required String result,
  }) = _PayaModel;

  factory PayaModel.fromJson(JSON json) => _$PayaModelFromJson(json);
}
