// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SpecListModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SpecListModel _$$_SpecListModelFromJson(Map<String, dynamic> json) =>
    _$_SpecListModel(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => SpecModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_SpecListModelToJson(_$_SpecListModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
