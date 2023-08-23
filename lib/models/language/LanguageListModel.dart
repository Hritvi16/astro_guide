import 'package:astro_guide/models/language/LanguageModel.dart';
import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'LanguageListModel.freezed.dart';
part 'LanguageListModel.g.dart';


@freezed
class LanguageListModel with _$LanguageListModel {
  factory LanguageListModel({
    required String status,
    required int code,
    required String message,
    required List<LanguageModel> data,
  }) = _LanguageListModel;

  factory LanguageListModel.fromJson(JSON json) => _$LanguageListModelFromJson(json);
}

