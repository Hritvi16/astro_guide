// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AstrologerResponseModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AstrologerResponseModelImpl _$$AstrologerResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AstrologerResponseModelImpl(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
      astrologer: json['astrologer'] == null
          ? null
          : AstrologerModel.fromJson(
              json['astrologer'] as Map<String, dynamic>),
      rating: json['rating'] == null
          ? null
          : RatingModel.fromJson(json['rating'] as Map<String, dynamic>),
      languages: (json['languages'] as List<dynamic>?)
          ?.map((e) => LanguageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      specifications: (json['specifications'] as List<dynamic>?)
          ?.map((e) => SpecModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      types: (json['types'] as List<dynamic>?)
          ?.map((e) => TypeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      reviews: (json['reviews'] as List<dynamic>?)
          ?.map((e) => ReviewModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      galleries: (json['galleries'] as List<dynamic>?)
          ?.map((e) => GalleryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      similar: (json['similar'] as List<dynamic>?)
          ?.map((e) => AstrologerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      wallet: (json['wallet'] as num?)?.toDouble(),
      free: json['free'] as int?,
    );

Map<String, dynamic> _$$AstrologerResponseModelImplToJson(
        _$AstrologerResponseModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'astrologer': instance.astrologer,
      'rating': instance.rating,
      'languages': instance.languages,
      'specifications': instance.specifications,
      'types': instance.types,
      'reviews': instance.reviews,
      'galleries': instance.galleries,
      'similar': instance.similar,
      'wallet': instance.wallet,
      'free': instance.free,
    };
