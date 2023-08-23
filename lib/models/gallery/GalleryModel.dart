import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'GalleryModel.freezed.dart';
part 'GalleryModel.g.dart';


@freezed
class GalleryModel with _$GalleryModel {
  factory GalleryModel({
    required int id,
    required int astro_id,
    required String image,
  }) = _GalleryModel;

  factory GalleryModel.fromJson(JSON json) => _$GalleryModelFromJson(json);
}
