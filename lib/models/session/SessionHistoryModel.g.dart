// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SessionHistoryModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SessionHistoryModel _$$_SessionHistoryModelFromJson(
        Map<String, dynamic> json) =>
    _$_SessionHistoryModel(
      id: json['id'] as int,
      sess_id: json['sess_id'] as int,
      session_id: json['session_id'] as String?,
      meeting_id: json['meeting_id'] as String?,
      k_id: json['k_id'] as int?,
      status: json['status'] as String,
      reason: json['reason'] as String?,
      started_at: json['started_at'] as String?,
      ended_at: json['ended_at'] as String?,
      rate: json['rate'] as int,
      amount: (json['amount'] as num?)?.toDouble(),
      commission: (json['commission'] as num).toDouble(),
      type: json['type'] as String,
      rating: (json['rating'] as num?)?.toDouble(),
      review: json['review'] as String?,
      reply: json['reply'] as String?,
      reviewed_at: json['reviewed_at'] as String?,
      anonymous: json['anonymous'] as int?,
      requested_at: json['requested_at'] as String,
      waitlisted_at: json['waitlisted_at'] as String?,
      cancelled_at: json['cancelled_at'] as String?,
      reconnet_at: json['reconnet_at'] as String?,
      rejected_at: json['rejected_at'] as String?,
      updated_at: json['updated_at'] as String,
      astro_id: json['astro_id'] as int?,
      astrologer: json['astrologer'] as String?,
      astro_profile: json['astro_profile'] as String?,
      user_id: json['user_id'] as int?,
      user: json['user'] as String?,
      user_profile: json['user_profile'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$$_SessionHistoryModelToJson(
        _$_SessionHistoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sess_id': instance.sess_id,
      'session_id': instance.session_id,
      'meeting_id': instance.meeting_id,
      'k_id': instance.k_id,
      'status': instance.status,
      'reason': instance.reason,
      'started_at': instance.started_at,
      'ended_at': instance.ended_at,
      'rate': instance.rate,
      'amount': instance.amount,
      'commission': instance.commission,
      'type': instance.type,
      'rating': instance.rating,
      'review': instance.review,
      'reply': instance.reply,
      'reviewed_at': instance.reviewed_at,
      'anonymous': instance.anonymous,
      'requested_at': instance.requested_at,
      'waitlisted_at': instance.waitlisted_at,
      'cancelled_at': instance.cancelled_at,
      'reconnet_at': instance.reconnet_at,
      'rejected_at': instance.rejected_at,
      'updated_at': instance.updated_at,
      'astro_id': instance.astro_id,
      'astrologer': instance.astrologer,
      'astro_profile': instance.astro_profile,
      'user_id': instance.user_id,
      'user': instance.user,
      'user_profile': instance.user_profile,
      'token': instance.token,
    };
