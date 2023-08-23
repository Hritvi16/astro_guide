import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'VideoModel.freezed.dart';
part 'VideoModel.g.dart';


@freezed
class VideoModel with _$VideoModel {
  factory VideoModel({
    required int id,
    required String title,
    required String link,
    required String image,
  }) = _VideoModel;

  factory VideoModel.fromJson(JSON json) => _$VideoModelFromJson(json);
}
