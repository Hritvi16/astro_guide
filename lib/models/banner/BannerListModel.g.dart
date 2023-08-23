// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BannerListModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BannerListModel _$$_BannerListModelFromJson(Map<String, dynamic> json) =>
    _$_BannerListModel(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => BannerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_BannerListModelToJson(_$_BannerListModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
