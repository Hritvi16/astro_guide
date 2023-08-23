// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ChatModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatModel _$$_ChatModelFromJson(Map<String, dynamic> json) => _$_ChatModel(
      id: json['id'] as int,
      ch_id: json['ch_id'] as int,
      message: json['message'] as String,
      sender: json['sender'] as String,
      type: json['type'] as String,
      m_type: json['m_type'] as String,
      sent_at: json['sent_at'] as String,
      received_at: json['received_at'] as String?,
      seen_at: json['seen_at'] as String?,
      error: json['error'] as int?,
    );

Map<String, dynamic> _$$_ChatModelToJson(_$_ChatModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ch_id': instance.ch_id,
      'message': instance.message,
      'sender': instance.sender,
      'type': instance.type,
      'm_type': instance.m_type,
      'sent_at': instance.sent_at,
      'received_at': instance.received_at,
      'seen_at': instance.seen_at,
      'error': instance.error,
    };
