// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SupportChatResponseModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SupportChatResponseModelImpl _$$SupportChatResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SupportChatResponseModelImpl(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : SupportChatModel.fromJson(json['data'] as Map<String, dynamic>),
      m_id: json['m_id'] as int?,
    );

Map<String, dynamic> _$$SupportChatResponseModelImplToJson(
        _$SupportChatResponseModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
      'm_id': instance.m_id,
    };
