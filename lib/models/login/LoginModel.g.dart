// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LoginModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LoginModel _$$_LoginModelFromJson(Map<String, dynamic> json) =>
    _$_LoginModel(
      code: json['code'] as int,
      status: json['status'] as String,
      message: json['message'] as String,
      access_token: json['access_token'] as String?,
      refresh_token: json['refresh_token'] as String?,
    );

Map<String, dynamic> _$$_LoginModelToJson(_$_LoginModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'message': instance.message,
      'access_token': instance.access_token,
      'refresh_token': instance.refresh_token,
    };
