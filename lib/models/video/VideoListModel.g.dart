// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'VideoListModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VideoListModelImpl _$$VideoListModelImplFromJson(Map<String, dynamic> json) =>
    _$VideoListModelImpl(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => VideoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$VideoListModelImplToJson(
        _$VideoListModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
