// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CountryModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CountryModel _$$_CountryModelFromJson(Map<String, dynamic> json) =>
    _$_CountryModel(
      id: json['id'] as int,
      name: json['name'] as String,
      nationality: json['nationality'] as String,
      icon: json['icon'] as String,
      code: json['code'] as String,
      imageFullUrl: json['imageFullUrl'] as String,
    );

Map<String, dynamic> _$$_CountryModelToJson(_$_CountryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'nationality': instance.nationality,
      'icon': instance.icon,
      'code': instance.code,
      'imageFullUrl': instance.imageFullUrl,
    };
