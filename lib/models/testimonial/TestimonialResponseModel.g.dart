// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TestimonialResponseModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TestimonialResponseModel _$$_TestimonialResponseModelFromJson(
        Map<String, dynamic> json) =>
    _$_TestimonialResponseModel(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : TestimonialModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_TestimonialResponseModelToJson(
        _$_TestimonialResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
