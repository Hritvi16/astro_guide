// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TestimonialModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TestimonialModelImpl _$$TestimonialModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TestimonialModelImpl(
      id: json['id'] as int,
      user_id: json['user_id'] as int,
      description: json['description'] as String,
      created_at: json['created_at'] as String,
      name: json['name'] as String,
      profile: json['profile'] as String?,
      state: json['state'] as String,
      country: json['country'] as String,
    );

Map<String, dynamic> _$$TestimonialModelImplToJson(
        _$TestimonialModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'description': instance.description,
      'created_at': instance.created_at,
      'name': instance.name,
      'profile': instance.profile,
      'state': instance.state,
      'country': instance.country,
    };
