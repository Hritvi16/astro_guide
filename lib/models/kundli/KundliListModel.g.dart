// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'KundliListModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_KundliListModel _$$_KundliListModelFromJson(Map<String, dynamic> json) =>
    _$_KundliListModel(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => KundliModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_KundliListModelToJson(_$_KundliListModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
