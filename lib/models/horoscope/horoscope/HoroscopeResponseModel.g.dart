// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HoroscopeResponseModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HoroscopeResponseModelImpl _$$HoroscopeResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$HoroscopeResponseModelImpl(
      status: json['status'] as String,
      code: (json['code'] as num).toInt(),
      message: json['message'] as String,
      daily: json['daily'] == null
          ? null
          : HoroscopeTimeModel.fromJson(json['daily'] as Map<String, dynamic>),
      weekly: json['weekly'] == null
          ? null
          : HoroscopeTimeModel.fromJson(json['weekly'] as Map<String, dynamic>),
      monthly: json['monthly'] == null
          ? null
          : HoroscopeTimeModel.fromJson(
              json['monthly'] as Map<String, dynamic>),
      yearly: json['yearly'] == null
          ? null
          : HoroscopeTimeModel.fromJson(json['yearly'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$HoroscopeResponseModelImplToJson(
        _$HoroscopeResponseModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'daily': instance.daily,
      'weekly': instance.weekly,
      'monthly': instance.monthly,
      'yearly': instance.yearly,
    };
