// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SupportResponseModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SupportResponseModelImpl _$$SupportResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SupportResponseModelImpl(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$$SupportResponseModelImplToJson(
        _$SupportResponseModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'id': instance.id,
    };
