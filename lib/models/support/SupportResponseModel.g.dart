// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SupportResponseModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SupportResponseModelImpl _$$SupportResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SupportResponseModelImpl(
      status: json['status'] as String,
      code: (json['code'] as num).toInt(),
      message: json['message'] as String,
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$SupportResponseModelImplToJson(
        _$SupportResponseModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'id': instance.id,
    };
