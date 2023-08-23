import 'package:astro_guide/models/spec/SpecModel.dart';
import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'SpecListModel.freezed.dart';
part 'SpecListModel.g.dart';


@freezed
class SpecListModel with _$SpecListModel {
  factory SpecListModel({
    required String status,
    required int code,
    required String message,
    List<SpecModel>? data,
  }) = _SpecListModel;

  factory SpecListModel.fromJson(JSON json) => _$SpecListModelFromJson(json);
}

