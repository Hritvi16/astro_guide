import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'SpecialModel.freezed.dart';
part 'SpecialModel.g.dart';


@freezed
class SpecialModel with _$SpecialModel {
  factory SpecialModel({
    required List<String> lucky_color_codes,
  }) = _SpecialModel;

  factory SpecialModel.fromJson(JSON json) => _$SpecialModelFromJson(json);
}
