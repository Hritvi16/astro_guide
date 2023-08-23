// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BlogListModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BlogListModel _$$_BlogListModelFromJson(Map<String, dynamic> json) =>
    _$_BlogListModel(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => BlogModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_BlogListModelToJson(_$_BlogListModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
