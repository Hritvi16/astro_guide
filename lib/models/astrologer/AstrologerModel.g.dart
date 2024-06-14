// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AstrologerModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AstrologerModelImpl _$$AstrologerModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AstrologerModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      mobile: json['mobile'] as String?,
      email: json['email'] as String,
      experience: json['experience'] as String,
      profile: json['profile'] as String,
      about: json['about'] as String,
      fav: (json['fav'] as num?)?.toInt(),
      follow: (json['follow'] as num?)?.toInt(),
      followers: (json['followers'] as num?)?.toInt(),
      favourite: (json['favourite'] as num?)?.toInt(),
      p_call: (json['p_call'] as num?)?.toInt(),
      p_chat: (json['p_chat'] as num?)?.toInt(),
      f_call: (json['f_call'] as num?)?.toInt(),
      f_chat: (json['f_chat'] as num?)?.toInt(),
      offer: (json['offer'] as num?)?.toInt(),
      free: (json['free'] as num?)?.toInt(),
      active: (json['active'] as num?)?.toInt(),
      online: (json['online'] as num?)?.toInt(),
      conline: (json['conline'] as num?)?.toInt(),
      rating: (json['rating'] as num?)?.toDouble(),
      total_rating: (json['total_rating'] as num?)?.toInt(),
      reviews: (json['reviews'] as num?)?.toInt(),
      country: json['country'] as String?,
      state: json['state'] as String?,
      city: json['city'] as String?,
      total_chat_sec: (json['total_chat_sec'] as num?)?.toInt(),
      total_call_sec: (json['total_call_sec'] as num?)?.toInt(),
      total_chat_rating: (json['total_chat_rating'] as num?)?.toDouble(),
      total_call_rating: (json['total_call_rating'] as num?)?.toDouble(),
      types: json['types'] as String?,
      languages: json['languages'] as String?,
      certified: (json['certified'] as num?)?.toInt(),
      ivr: (json['ivr'] as num?)?.toInt(),
      video: (json['video'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$AstrologerModelImplToJson(
        _$AstrologerModelImpl instance) =>
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
      'active': instance.active,
      'online': instance.online,
      'conline': instance.conline,
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
      'certified': instance.certified,
      'ivr': instance.ivr,
      'video': instance.video,
    };
