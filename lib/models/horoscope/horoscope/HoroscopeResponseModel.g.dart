// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HoroscopeResponseModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HoroscopeResponseModelImpl _$$HoroscopeResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$HoroscopeResponseModelImpl(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : HoroscopeModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$HoroscopeResponseModelImplToJson(
        _$HoroscopeResponseModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
