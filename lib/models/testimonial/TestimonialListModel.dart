import 'package:astro_guide/models/testimonial/TestimonialModel.dart';
import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'TestimonialListModel.freezed.dart';
part 'TestimonialListModel.g.dart';


@freezed
class TestimonialListModel with _$TestimonialListModel {
  factory TestimonialListModel({
    required String status,
    required int code,
    required String message,
    List<TestimonialModel>? data,
  }) = _TestimonialListModel;

  factory TestimonialListModel.fromJson(JSON json) => _$TestimonialListModelFromJson(json);
}

