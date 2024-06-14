// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'StateModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StateModelImpl _$$StateModelImplFromJson(Map<String, dynamic> json) =>
    _$StateModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      co_id: (json['co_id'] as num).toInt(),
    );

Map<String, dynamic> _$$StateModelImplToJson(_$StateModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'co_id': instance.co_id,
    };
