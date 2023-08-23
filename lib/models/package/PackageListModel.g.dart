// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PackageListModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PackageListModel _$$_PackageListModelFromJson(Map<String, dynamic> json) =>
    _$_PackageListModel(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => PackageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PackageListModelToJson(_$_PackageListModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
