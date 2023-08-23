// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'StateListModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StateListModel _$$_StateListModelFromJson(Map<String, dynamic> json) =>
    _$_StateListModel(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => StateModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_StateListModelToJson(_$_StateListModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
