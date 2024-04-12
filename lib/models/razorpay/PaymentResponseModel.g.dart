// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PaymentResponseModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentResponseModelImpl _$$PaymentResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PaymentResponseModelImpl(
      status: json['status'] as String,
      code: json['code'] as int?,
      error: json['error'] == null
          ? null
          : ErrorModel.fromJson(json['error'] as Map<String, dynamic>),
      success: json['success'] == null
          ? null
          : SuccessModel.fromJson(json['success'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PaymentResponseModelImplToJson(
        _$PaymentResponseModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'error': instance.error,
      'success': instance.success,
    };
