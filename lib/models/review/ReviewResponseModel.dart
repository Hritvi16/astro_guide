import 'package:astro_guide/models/review/ReviewModel.dart';
import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ReviewResponseModel.freezed.dart';
part 'ReviewResponseModel.g.dart';


@freezed
class ReviewResponseModel with _$ReviewResponseModel {
  factory ReviewResponseModel({
    required String status,
    required int code,
    required String message,
    ReviewModel? data,
    int? m_id,
  }) = _ReviewResponseModel;

  factory ReviewResponseModel.fromJson(JSON json) => _$ReviewResponseModelFromJson(json);
}

