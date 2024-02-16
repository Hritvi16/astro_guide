// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'KundliModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KundliModelImpl _$$KundliModelImplFromJson(Map<String, dynamic> json) =>
    _$KundliModelImpl(
      id: json['id'] as int,
      user_id: json['user_id'] as int,
      name: json['name'] as String,
      dob: json['dob'] as String,
      gender: json['gender'] as String,
      ci_id: json['ci_id'] as int?,
      marital_status: json['marital_status'] as String,
      type: json['type'] as String,
      r_id: json['r_id'] as int?,
      created_at: json['created_at'] as String,
      updated_at: json['updated_at'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      country: json['country'] as String?,
      relation: json['relation'] as String?,
    );

Map<String, dynamic> _$$KundliModelImplToJson(_$KundliModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'name': instance.name,
      'dob': instance.dob,
      'gender': instance.gender,
      'ci_id': instance.ci_id,
      'marital_status': instance.marital_status,
      'type': instance.type,
      'r_id': instance.r_id,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'relation': instance.relation,
    };
