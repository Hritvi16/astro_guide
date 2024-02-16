import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'SpecModel.freezed.dart';
part 'SpecModel.g.dart';


@freezed
class SpecModel with _$SpecModel {
  factory SpecModel({
    required int id,
    required String spec,
    required String icon,
    required String imageFullUrl,
  }) = _SpecModel;

  factory SpecModel.fromJson(JSON json) => _$SpecModelFromJson(json);
}
