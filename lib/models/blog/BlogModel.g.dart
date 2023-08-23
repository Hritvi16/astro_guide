// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BlogModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BlogModel _$$_BlogModelFromJson(Map<String, dynamic> json) => _$_BlogModel(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
      name: json['name'] as String,
      created_at: json['created_at'] as String,
    );

Map<String, dynamic> _$$_BlogModelToJson(_$_BlogModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'image': instance.image,
      'name': instance.name,
      'created_at': instance.created_at,
    };
