// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SupportModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SupportModelImpl _$$SupportModelImplFromJson(Map<String, dynamic> json) =>
    _$SupportModelImpl(
      id: (json['id'] as num).toInt(),
      type: json['type'] as String,
      reason: json['reason'] as String,
      user_id: (json['user_id'] as num?)?.toInt(),
      astro_id: (json['astro_id'] as num?)?.toInt(),
      admin_id: (json['admin_id'] as num?)?.toInt(),
      socket: json['socket'] as String?,
      ad_socket: json['ad_socket'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      review: json['review'] as String?,
      reviewed_at: json['reviewed_at'] as String?,
      created_at: json['created_at'] as String,
      updated_at: json['updated_at'] as String?,
      status: json['status'] as String,
      message: json['message'] as String?,
      sender: json['sender'] as String?,
      sent_at: json['sent_at'] as String?,
    );

Map<String, dynamic> _$$SupportModelImplToJson(_$SupportModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'reason': instance.reason,
      'user_id': instance.user_id,
      'astro_id': instance.astro_id,
      'admin_id': instance.admin_id,
      'socket': instance.socket,
      'ad_socket': instance.ad_socket,
      'rating': instance.rating,
      'review': instance.review,
      'reviewed_at': instance.reviewed_at,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'status': instance.status,
      'message': instance.message,
      'sender': instance.sender,
      'sent_at': instance.sent_at,
    };
