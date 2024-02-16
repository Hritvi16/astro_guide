// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CountryModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CountryModelImpl _$$CountryModelImplFromJson(Map<String, dynamic> json) =>
    _$CountryModelImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      nationality: json['nationality'] as String,
      icon: json['icon'] as String,
      code: json['code'] as String,
      imageFullUrl: json['imageFullUrl'] as String,
    );

Map<String, dynamic> _$$CountryModelImplToJson(_$CountryModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'nationality': instance.nationality,
      'icon': instance.icon,
      'code': instance.code,
      'imageFullUrl': instance.imageFullUrl,
    };
