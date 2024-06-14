// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CityListModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CityListModelImpl _$$CityListModelImplFromJson(Map<String, dynamic> json) =>
    _$CityListModelImpl(
      status: json['status'] as String,
      code: (json['code'] as num).toInt(),
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CityModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CityListModelImplToJson(_$CityListModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
