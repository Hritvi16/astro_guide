import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'TestimonialModel.freezed.dart';
part 'TestimonialModel.g.dart';


@freezed
class TestimonialModel with _$TestimonialModel {
  factory TestimonialModel({
    required int id,
    required int user_id,
    required String description,
    required String created_at,
    required String name,
    String? profile,
    required String state,
    required String country,
  }) = _TestimonialModel;

  factory TestimonialModel.fromJson(JSON json) => _$TestimonialModelFromJson(json);
}
