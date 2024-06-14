// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SpecModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SpecModelImpl _$$SpecModelImplFromJson(Map<String, dynamic> json) =>
    _$SpecModelImpl(
      id: (json['id'] as num).toInt(),
      spec: json['spec'] as String,
      icon: json['icon'] as String,
      imageFullUrl: json['imageFullUrl'] as String,
    );

Map<String, dynamic> _$$SpecModelImplToJson(_$SpecModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'spec': instance.spec,
      'icon': instance.icon,
      'imageFullUrl': instance.imageFullUrl,
    };
