// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ChatResponseModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatResponseModelImpl _$$ChatResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ChatResponseModelImpl(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : ChatModel.fromJson(json['data'] as Map<String, dynamic>),
      m_id: json['m_id'] as int?,
    );

Map<String, dynamic> _$$ChatResponseModelImplToJson(
        _$ChatResponseModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
      'm_id': instance.m_id,
    };
