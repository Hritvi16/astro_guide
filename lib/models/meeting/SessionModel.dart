import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'SessionModel.freezed.dart';
part 'SessionModel.g.dart';

@freezed
class SessionModel with _$SessionModel {
  factory SessionModel({
    required int code,
    required String status,
    required String message,
    String? data,
  }) = _SessionModel;

  factory SessionModel.fromJson(JSON json) => _$SessionModelFromJson(json);
}
