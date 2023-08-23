// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ReviewModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReviewModel _$$_ReviewModelFromJson(Map<String, dynamic> json) =>
    _$_ReviewModel(
      id: json['id'] as int,
      order_id: json['order_id'] as String,
      category: json['category'] as String,
      rating: (json['rating'] as num).toDouble(),
      review: json['review'] as String?,
      reply: json['reply'] as String?,
      anonymous: json['anonymous'] as int,
      user_id: json['user_id'] as int?,
      user: json['user'] as String?,
      user_profile: json['user_profile'] as String?,
      astrologer: json['astrologer'] as String?,
      astro_profile: json['astro_profile'] as String?,
      reviewed_at: json['reviewed_at'] as String,
      replied_at: json['replied_at'] as String?,
      started_at: json['started_at'] as String,
    );

Map<String, dynamic> _$$_ReviewModelToJson(_$_ReviewModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_id': instance.order_id,
      'category': instance.category,
      'rating': instance.rating,
      'review': instance.review,
      'reply': instance.reply,
      'anonymous': instance.anonymous,
      'user_id': instance.user_id,
      'user': instance.user,
      'user_profile': instance.user_profile,
      'astrologer': instance.astrologer,
      'astro_profile': instance.astro_profile,
      'reviewed_at': instance.reviewed_at,
      'replied_at': instance.replied_at,
      'started_at': instance.started_at,
    };
