// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ErrorModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ErrorModelImpl _$$ErrorModelImplFromJson(Map<String, dynamic> json) =>
    _$ErrorModelImpl(
      code: json['code'] as String?,
      description: json['description'] as String?,
      source: json['source'] as String?,
      step: json['step'] as String?,
      reason: json['reason'] as String?,
      metadata: json['metadata'] == null
          ? null
          : MetadataModel.fromJson(json['metadata'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ErrorModelImplToJson(_$ErrorModelImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'description': instance.description,
      'source': instance.source,
      'step': instance.step,
      'reason': instance.reason,
      'metadata': instance.metadata,
    };
