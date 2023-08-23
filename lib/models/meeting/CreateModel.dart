import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'CreateModel.freezed.dart';
part 'CreateModel.g.dart';

@freezed
class CreateModel with _$CreateModel {
  factory CreateModel({
    required int code,
    required String status,
    required String message,
    String? token,
    String? meetingID,
    String? sessionID,
    int? meet_id,
  }) = _CreateModel;

  factory CreateModel.fromJson(JSON json) => _$CreateModelFromJson(json);
}
