import 'package:astro_guide/models/gallery/GalleryModel.dart';
import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'GalleryListModel.freezed.dart';
part 'GalleryListModel.g.dart';


@freezed
class GalleryListModel with _$GalleryListModel {
  factory GalleryListModel({
    required String status,
    required int code,
    required String message,
    List<GalleryModel>? data,
  }) = _GalleryListModel;

  factory GalleryListModel.fromJson(JSON json) => _$GalleryListModelFromJson(json);
}

