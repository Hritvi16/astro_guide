import 'package:astro_guide/models/testimonial/TestimonialModel.dart';
import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'TestimonialResponseModel.freezed.dart';
part 'TestimonialResponseModel.g.dart';


@freezed
class TestimonialResponseModel with _$TestimonialResponseModel {
  factory TestimonialResponseModel({
    required String status,
    required int code,
    required String message,
    TestimonialModel? data,
  }) = _TestimonialResponseModel;

  factory TestimonialResponseModel.fromJson(JSON json) => _$TestimonialResponseModelFromJson(json);
}

