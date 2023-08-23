import 'package:astro_guide/models/astrologer/AstrologerModel.dart';
import 'package:astro_guide/models/blog/BlogModel.dart';
import 'package:astro_guide/models/spec/SpecModel.dart';
import 'package:astro_guide/models/testimonial/TestimonialModel.dart';
import 'package:astro_guide/models/user/UserModel.dart';
import 'package:astro_guide/models/video/VideoModel.dart';
import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:astro_guide/models/banner/BannerModel.dart';

part 'DashboardModel.freezed.dart';
part 'DashboardModel.g.dart';


@freezed
class DashboardModel with _$DashboardModel {
  factory DashboardModel({
    required String status,
    required int code,
    required String message,
    List<BannerModel>? banners,
    List<SpecModel>? specifications,
    List<AstrologerModel>? new_astrologers,
    List<AstrologerModel>? live_astrologers,
    List<BlogModel>? blogs,
    List<VideoModel>? videos,
    List<TestimonialModel>? testimonials,
    UserModel? user,
  }) = _DashboardModel;

  factory DashboardModel.fromJson(JSON json) => _$DashboardModelFromJson(json);
}

