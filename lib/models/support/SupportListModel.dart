import 'package:astro_guide/models/support/SupportModel.dart';
import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'SupportListModel.freezed.dart';
part 'SupportListModel.g.dart';


@freezed
class SupportListModel with _$SupportListModel {
  factory SupportListModel({
    required String status,
    required int code,
    required String message,
    List<SupportModel>? data,
  }) = _SupportListModel;

  factory SupportListModel.fromJson(JSON json) => _$SupportListModelFromJson(json);
}

