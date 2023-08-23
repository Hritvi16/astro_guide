// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RelationListModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RelationListModel _$$_RelationListModelFromJson(Map<String, dynamic> json) =>
    _$_RelationListModel(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => RelationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_RelationListModelToJson(
        _$_RelationListModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
