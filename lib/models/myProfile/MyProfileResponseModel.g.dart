// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MyProfileResponseModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MyProfileResponseModelImpl _$$MyProfileResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MyProfileResponseModelImpl(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : UserModel.fromJson(json['data'] as Map<String, dynamic>),
      countries: (json['countries'] as List<dynamic>?)
          ?.map((e) => CountryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      cities: (json['cities'] as List<dynamic>?)
          ?.map((e) => CityModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MyProfileResponseModelImplToJson(
        _$MyProfileResponseModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
      'countries': instance.countries,
      'cities': instance.cities,
    };
