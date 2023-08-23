// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CityModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CityModel _$$_CityModelFromJson(Map<String, dynamic> json) => _$_CityModel(
      id: json['id'] as int,
      name: json['name'] as String,
      st_id: json['st_id'] as int,
      state: json['state'] as String?,
      country: json['country'] as String?,
    );

Map<String, dynamic> _$$_CityModelToJson(_$_CityModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'st_id': instance.st_id,
      'state': instance.state,
      'country': instance.country,
    };
