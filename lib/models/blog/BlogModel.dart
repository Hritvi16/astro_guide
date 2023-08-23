import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'BlogModel.freezed.dart';
part 'BlogModel.g.dart';


@freezed
class BlogModel with _$BlogModel {
  factory BlogModel({
    required int id,
    required String title,
    required String description,
    required String image,
    required String name,
    required String created_at,
  }) = _BlogModel;

  factory BlogModel.fromJson(JSON json) => _$BlogModelFromJson(json);
}
