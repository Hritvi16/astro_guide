import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'LanguageModel.freezed.dart';
part 'LanguageModel.g.dart';


@freezed
class LanguageModel with _$LanguageModel {
  factory LanguageModel({
    required int id,
    required String lang,
  }) = _LanguageModel;

  factory LanguageModel.fromJson(JSON json) => _$LanguageModelFromJson(json);
}
