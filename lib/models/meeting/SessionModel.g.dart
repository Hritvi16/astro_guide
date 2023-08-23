// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SessionModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SessionModel _$$_SessionModelFromJson(Map<String, dynamic> json) =>
    _$_SessionModel(
      code: json['code'] as int,
      status: json['status'] as String,
      message: json['message'] as String,
      data: json['data'] as String?,
    );

Map<String, dynamic> _$$_SessionModelToJson(_$_SessionModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
