// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SupportListModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SupportListModel _$$_SupportListModelFromJson(Map<String, dynamic> json) =>
    _$_SupportListModel(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => SupportModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_SupportListModelToJson(_$_SupportListModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
