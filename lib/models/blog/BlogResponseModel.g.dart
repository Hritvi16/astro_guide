// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BlogResponseModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BlogResponseModel _$$_BlogResponseModelFromJson(Map<String, dynamic> json) =>
    _$_BlogResponseModel(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : BlogModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_BlogResponseModelToJson(
        _$_BlogResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
