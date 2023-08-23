// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GalleryListModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GalleryListModel _$$_GalleryListModelFromJson(Map<String, dynamic> json) =>
    _$_GalleryListModel(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => GalleryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_GalleryListModelToJson(_$_GalleryListModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
