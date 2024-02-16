// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TestimonialResponseModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TestimonialResponseModelImpl _$$TestimonialResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TestimonialResponseModelImpl(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : TestimonialModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TestimonialResponseModelImplToJson(
        _$TestimonialResponseModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
