// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'StateListModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StateListModelImpl _$$StateListModelImplFromJson(Map<String, dynamic> json) =>
    _$StateListModelImpl(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => StateModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$StateListModelImplToJson(
        _$StateListModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
