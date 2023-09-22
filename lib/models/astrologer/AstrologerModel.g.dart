// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AstrologerModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AstrologerModel _$$_AstrologerModelFromJson(Map<String, dynamic> json) =>
    _$_AstrologerModel(
      id: json['id'] as int,
      name: json['name'] as String,
      mobile: json['mobile'] as String,
      email: json['email'] as String,
      experience: (json['experience'] as num).toDouble(),
      profile: json['profile'] as String,
      about: json['about'] as String,
      fav: json['fav'] as int?,
      follow: json['follow'] as int?,
      followers: json['followers'] as int?,
      favourite: json['favourite'] as int?,
      p_call: json['p_call'] as int?,
      p_chat: json['p_chat'] as int?,
      f_call: json['f_call'] as int?,
      f_chat: json['f_chat'] as int?,
      offer: json['offer'] as int?,
      free: json['free'] as int?,
      online: json['online'] as int?,
      rating: (json['rating'] as num?)?.toDouble(),
      total_rating: json['total_rating'] as int?,
      reviews: json['reviews'] as int?,
      country: json['country'] as String?,
      state: json['state'] as String?,
      city: json['city'] as String?,
      total_chat_sec: json['total_chat_sec'] as int?,
      total_call_sec: json['total_call_sec'] as int?,
      total_chat_rating: (json['total_chat_rating'] as num?)?.toDouble(),
      total_call_rating: (json['total_call_rating'] as num?)?.toDouble(),
      types: json['types'] as String?,
      languages: json['languages'] as String?,
    );

Map<String, dynamic> _$$_AstrologerModelToJson(_$_AstrologerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'mobile': instance.mobile,
      'email': instance.email,
      'experience': instance.experience,
      'profile': instance.profile,
      'about': instance.about,
      'fav': instance.fav,
      'follow': instance.follow,
      'followers': instance.followers,
      'favourite': instance.favourite,
      'p_call': instance.p_call,
      'p_chat': instance.p_chat,
      'f_call': instance.f_call,
      'f_chat': instance.f_chat,
      'offer': instance.offer,
      'free': instance.free,
      'online': instance.online,
      'rating': instance.rating,
      'total_rating': instance.total_rating,
      'reviews': instance.reviews,
      'country': instance.country,
      'state': instance.state,
      'city': instance.city,
      'total_chat_sec': instance.total_chat_sec,
      'total_call_sec': instance.total_call_sec,
      'total_chat_rating': instance.total_chat_rating,
      'total_call_rating': instance.total_call_rating,
      'types': instance.types,
      'languages': instance.languages,
    };
