// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TypeListModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TypeListModel _$$_TypeListModelFromJson(Map<String, dynamic> json) =>
    _$_TypeListModel(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => TypeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_TypeListModelToJson(_$_TypeListModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
