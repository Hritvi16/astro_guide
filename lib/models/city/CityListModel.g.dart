// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CityListModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CityListModel _$$_CityListModelFromJson(Map<String, dynamic> json) =>
    _$_CityListModel(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => CityModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_CityListModelToJson(_$_CityListModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
