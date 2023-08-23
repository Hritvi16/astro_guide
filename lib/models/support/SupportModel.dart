import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'SupportModel.freezed.dart';
part 'SupportModel.g.dart';


@freezed
class SupportModel with _$SupportModel {
  factory SupportModel({
    required int id,
    required String type,
    required String reason,
    int? user_id,
    int? astro_id,
    int? admin_id,
    String? socket,
    String? ad_socket,
    double? rating,
    String? review,
    String? reviewed_at,
    required String created_at,
    String? updated_at,
    required String status,
    String? message,
    String? sender,
    String? sent_at,
  }) = _SupportModel;

  factory SupportModel.fromJson(JSON json) => _$SupportModelFromJson(json);
}
