// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SupportChatResponseModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SupportChatResponseModel _$$_SupportChatResponseModelFromJson(
        Map<String, dynamic> json) =>
    _$_SupportChatResponseModel(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : SupportChatModel.fromJson(json['data'] as Map<String, dynamic>),
      m_id: json['m_id'] as int?,
    );

Map<String, dynamic> _$$_SupportChatResponseModelToJson(
        _$_SupportChatResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
      'm_id': instance.m_id,
    };
