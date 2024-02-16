// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TestimonialListModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TestimonialListModelImpl _$$TestimonialListModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TestimonialListModelImpl(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => TestimonialModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TestimonialListModelImplToJson(
        _$TestimonialListModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
