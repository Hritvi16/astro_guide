// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GalleryModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GalleryModelImpl _$$GalleryModelImplFromJson(Map<String, dynamic> json) =>
    _$GalleryModelImpl(
      id: (json['id'] as num).toInt(),
      astro_id: (json['astro_id'] as num).toInt(),
      image: json['image'] as String,
    );

Map<String, dynamic> _$$GalleryModelImplToJson(_$GalleryModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'astro_id': instance.astro_id,
      'image': instance.image,
    };
