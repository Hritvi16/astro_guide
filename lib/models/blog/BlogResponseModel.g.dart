// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BlogResponseModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BlogResponseModelImpl _$$BlogResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BlogResponseModelImpl(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : BlogModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$BlogResponseModelImplToJson(
        _$BlogResponseModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
