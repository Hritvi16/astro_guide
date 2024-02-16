// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ReviewResponseModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReviewResponseModelImpl _$$ReviewResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ReviewResponseModelImpl(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : ReviewModel.fromJson(json['data'] as Map<String, dynamic>),
      m_id: json['m_id'] as int?,
    );

Map<String, dynamic> _$$ReviewResponseModelImplToJson(
        _$ReviewResponseModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
      'm_id': instance.m_id,
    };
