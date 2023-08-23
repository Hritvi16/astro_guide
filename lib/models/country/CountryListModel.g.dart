// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CountryListModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CountryListModel _$$_CountryListModelFromJson(Map<String, dynamic> json) =>
    _$_CountryListModel(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => CountryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_CountryListModelToJson(_$_CountryListModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
