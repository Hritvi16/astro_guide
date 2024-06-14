// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SupportChatModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SupportChatModelImpl _$$SupportChatModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SupportChatModelImpl(
      id: (json['id'] as num).toInt(),
      sup_id: (json['sup_id'] as num).toInt(),
      sender: json['sender'] as String,
      message: json['message'] as String,
      sent_at: json['sent_at'] as String,
      seen_at: json['seen_at'] as String?,
      error: (json['error'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$SupportChatModelImplToJson(
        _$SupportChatModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sup_id': instance.sup_id,
      'sender': instance.sender,
      'message': instance.message,
      'sent_at': instance.sent_at,
      'seen_at': instance.seen_at,
      'error': instance.error,
    };
