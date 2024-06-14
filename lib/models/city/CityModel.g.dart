// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CityModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CityModelImpl _$$CityModelImplFromJson(Map<String, dynamic> json) =>
    _$CityModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      st_id: (json['st_id'] as num).toInt(),
      state: json['state'] as String?,
      country: json['country'] as String?,
    );

Map<String, dynamic> _$$CityModelImplToJson(_$CityModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'st_id': instance.st_id,
      'state': instance.state,
      'country': instance.country,
    };
