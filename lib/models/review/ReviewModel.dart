import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ReviewModel.freezed.dart';
part 'ReviewModel.g.dart';


@freezed
class ReviewModel with _$ReviewModel {
  factory ReviewModel({
    required int id,
    required String order_id,
    required String category,
    required double rating,
    String? review,
    String? reply,
    required int anonymous,
    int? user_id,
    String? user,
    String? user_profile,
    String? astrologer,
    String? astro_profile,
    required String reviewed_at,
    String? replied_at,
    required String started_at,
  }) = _ReviewModel;

  factory ReviewModel.fromJson(JSON json) => _$ReviewModelFromJson(json);
}
