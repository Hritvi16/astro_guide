import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'RatingModel.freezed.dart';
part 'RatingModel.g.dart';


@freezed
class RatingModel with _$RatingModel {
  factory RatingModel({
    required int rating1,
    required int rating2,
    required int rating3,
    required int rating4,
    required int rating5,
  }) = _RatingModel;

  factory RatingModel.fromJson(JSON json) => _$RatingModelFromJson(json);
}
