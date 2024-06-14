// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PackageModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PackageModelImpl _$$PackageModelImplFromJson(Map<String, dynamic> json) =>
    _$PackageModelImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String,
      discount: (json['discount'] as num?)?.toInt(),
      type: json['type'] as String?,
      amount: (json['amount'] as num).toInt(),
    );

Map<String, dynamic> _$$PackageModelImplToJson(_$PackageModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'discount': instance.discount,
      'type': instance.type,
      'amount': instance.amount,
    };
