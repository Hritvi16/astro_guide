// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RelationListModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RelationListModelImpl _$$RelationListModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RelationListModelImpl(
      status: json['status'] as String,
      code: (json['code'] as num).toInt(),
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => RelationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$RelationListModelImplToJson(
        _$RelationListModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
