// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BannerListModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BannerListModelImpl _$$BannerListModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BannerListModelImpl(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => BannerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$BannerListModelImplToJson(
        _$BannerListModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
