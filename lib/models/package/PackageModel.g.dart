// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PackageModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PackageModel _$$_PackageModelFromJson(Map<String, dynamic> json) =>
    _$_PackageModel(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      discount: json['discount'] as int?,
      type: json['type'] as String?,
      amount: json['amount'] as int,
    );

Map<String, dynamic> _$$_PackageModelToJson(_$_PackageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'discount': instance.discount,
      'type': instance.type,
      'amount': instance.amount,
    };
