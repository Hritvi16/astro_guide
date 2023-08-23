// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SupportChatModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SupportChatModel _$$_SupportChatModelFromJson(Map<String, dynamic> json) =>
    _$_SupportChatModel(
      id: json['id'] as int,
      sup_id: json['sup_id'] as int,
      sender: json['sender'] as String,
      message: json['message'] as String,
      sent_at: json['sent_at'] as String,
      seen_at: json['seen_at'] as String?,
      error: json['error'] as int?,
    );

Map<String, dynamic> _$$_SupportChatModelToJson(_$_SupportChatModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sup_id': instance.sup_id,
      'sender': instance.sender,
      'message': instance.message,
      'sent_at': instance.sent_at,
      'seen_at': instance.seen_at,
      'error': instance.error,
    };
