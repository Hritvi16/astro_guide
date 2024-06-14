// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DashboardModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DashboardModelImpl _$$DashboardModelImplFromJson(Map<String, dynamic> json) =>
    _$DashboardModelImpl(
      status: json['status'] as String,
      code: (json['code'] as num).toInt(),
      message: json['message'] as String,
      banners: (json['banners'] as List<dynamic>?)
          ?.map((e) => BannerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      specifications: (json['specifications'] as List<dynamic>?)
          ?.map((e) => SpecModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      new_astrologers: (json['new_astrologers'] as List<dynamic>?)
          ?.map((e) => AstrologerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      live_astrologers: (json['live_astrologers'] as List<dynamic>?)
          ?.map((e) => AstrologerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      blogs: (json['blogs'] as List<dynamic>?)
          ?.map((e) => BlogModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      videos: (json['videos'] as List<dynamic>?)
          ?.map((e) => VideoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      testimonials: (json['testimonials'] as List<dynamic>?)
          ?.map((e) => TestimonialModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      session: json['session'] == null
          ? null
          : SessionHistoryModel.fromJson(
              json['session'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DashboardModelImplToJson(
        _$DashboardModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'banners': instance.banners,
      'specifications': instance.specifications,
      'new_astrologers': instance.new_astrologers,
      'live_astrologers': instance.live_astrologers,
      'blogs': instance.blogs,
      'videos': instance.videos,
      'testimonials': instance.testimonials,
      'user': instance.user,
      'session': instance.session,
    };
