// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SupportResponseModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SupportResponseModel _$$_SupportResponseModelFromJson(
        Map<String, dynamic> json) =>
    _$_SupportResponseModel(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$$_SupportResponseModelToJson(
        _$_SupportResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'id': instance.id,
    };
