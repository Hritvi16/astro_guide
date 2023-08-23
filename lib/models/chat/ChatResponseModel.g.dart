// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ChatResponseModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatResponseModel _$$_ChatResponseModelFromJson(Map<String, dynamic> json) =>
    _$_ChatResponseModel(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : ChatModel.fromJson(json['data'] as Map<String, dynamic>),
      m_id: json['m_id'] as int?,
    );

Map<String, dynamic> _$$_ChatResponseModelToJson(
        _$_ChatResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
      'm_id': instance.m_id,
    };
