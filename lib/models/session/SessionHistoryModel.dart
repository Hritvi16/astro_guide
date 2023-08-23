import 'package:astro_guide/models/package/PackageModel.dart';
import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'SessionHistoryModel.freezed.dart';
part 'SessionHistoryModel.g.dart';


@freezed
class SessionHistoryModel with _$SessionHistoryModel {
  factory SessionHistoryModel({
    required int id,
    required int sess_id,
    String? session_id,
    String? meeting_id,
    int? k_id,
    required String status,
    String? reason,
    String? started_at,
    String? ended_at,
    required int rate,
    double? amount,
    required double commission,
    required String type,
    double? rating,
    String? review,
    String? reply,
    String? reviewed_at,
    int? anonymous,
    required String requested_at,
    String? waitlisted_at,
    String? cancelled_at,
    String? reconnet_at,
    String? rejected_at,
    required String updated_at,
    int? astro_id,
    String? astrologer,
    String? astro_profile,
    int? user_id,
    String? user,
    String? user_profile,
    String? token,
  }) = _SessionHistoryModel;

  factory SessionHistoryModel.fromJson(JSON json) => _$SessionHistoryModelFromJson(json);
}

