// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ValuesModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ValuesModelImpl _$$ValuesModelImplFromJson(Map<String, dynamic> json) =>
    _$ValuesModelImpl(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
      countries: (json['countries'] as List<dynamic>?)
          ?.map((e) => CountryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      cities: (json['cities'] as List<dynamic>?)
          ?.map((e) => CityModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      types: (json['types'] as List<dynamic>?)
          ?.map((e) => TypeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      specifications: (json['specifications'] as List<dynamic>?)
          ?.map((e) => SpecModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      languages: (json['languages'] as List<dynamic>?)
          ?.map((e) => LanguageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ValuesModelImplToJson(_$ValuesModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'countries': instance.countries,
      'cities': instance.cities,
      'types': instance.types,
      'specifications': instance.specifications,
      'languages': instance.languages,
    };
