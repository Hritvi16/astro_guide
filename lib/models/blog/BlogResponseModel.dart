import 'package:astro_guide/models/blog/BlogModel.dart';
import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'BlogResponseModel.freezed.dart';
part 'BlogResponseModel.g.dart';


@freezed
class BlogResponseModel with _$BlogResponseModel {
  factory BlogResponseModel({
    required String status,
    required int code,
    required String message,
    BlogModel? data,
  }) = _BlogResponseModel;

  factory BlogResponseModel.fromJson(JSON json) => _$BlogResponseModelFromJson(json);
}

