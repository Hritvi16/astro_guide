// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SupportListModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SupportListModelImpl _$$SupportListModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SupportListModelImpl(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => SupportModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SupportListModelImplToJson(
        _$SupportListModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
