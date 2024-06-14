// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CountryListModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CountryListModelImpl _$$CountryListModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CountryListModelImpl(
      status: json['status'] as String,
      code: (json['code'] as num).toInt(),
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CountryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CountryListModelImplToJson(
        _$CountryListModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
