// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LoginModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginModelImpl _$$LoginModelImplFromJson(Map<String, dynamic> json) =>
    _$LoginModelImpl(
      code: json['code'] as int,
      status: json['status'] as String,
      message: json['message'] as String,
      access_token: json['access_token'] as String?,
      refresh_token: json['refresh_token'] as String?,
      whatsapp: json['whatsapp'] as int?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$$LoginModelImplToJson(_$LoginModelImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'message': instance.message,
      'access_token': instance.access_token,
      'refresh_token': instance.refresh_token,
      'whatsapp': instance.whatsapp,
      'email': instance.email,
    };
