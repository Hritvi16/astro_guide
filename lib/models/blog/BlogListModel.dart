import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:astro_guide/models/blog/BlogModel.dart';

part 'BlogListModel.freezed.dart';
part 'BlogListModel.g.dart';


@freezed
class BlogListModel with _$BlogListModel {
  factory BlogListModel({
    required String status,
    required int code,
    required String message,
    List<BlogModel>? data,
  }) = _BlogListModel;

  factory BlogListModel.fromJson(JSON json) => _$BlogListModelFromJson(json);
}

