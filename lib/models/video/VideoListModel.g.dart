// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'VideoListModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_VideoListModel _$$_VideoListModelFromJson(Map<String, dynamic> json) =>
    _$_VideoListModel(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => VideoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_VideoListModelToJson(_$_VideoListModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
