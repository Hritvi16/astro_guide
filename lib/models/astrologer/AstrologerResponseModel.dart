import 'package:astro_guide/models/gallery/GalleryModel.dart';
import 'package:astro_guide/models/rating/RatingModel.dart';
import 'package:astro_guide/models/review/ReviewModel.dart';
import 'package:astro_guide/models/type/TypeModel.dart';
import 'package:astro_guide/models/astrologer/AstrologerModel.dart';
import 'package:astro_guide/models/language/LanguageModel.dart';
import 'package:astro_guide/models/spec/SpecModel.dart';
import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'AstrologerResponseModel.freezed.dart';
part 'AstrologerResponseModel.g.dart';


@freezed
class AstrologerResponseModel with _$AstrologerResponseModel {
  factory AstrologerResponseModel({
    required String status,
    required int code,
    required String message,
    AstrologerModel? astrologer,
    RatingModel? rating,
    List<LanguageModel>? languages,
    List<SpecModel>? specifications,
    List<TypeModel>? types,
    List<ReviewModel>? reviews,
    List<GalleryModel>? galleries,
    List<AstrologerModel>? similar,
  }) = _AstrologerResponseModel;

  factory AstrologerResponseModel.fromJson(JSON json) => _$AstrologerResponseModelFromJson(json);
}

