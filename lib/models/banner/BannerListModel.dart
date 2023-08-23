import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:astro_guide/models/banner/BannerModel.dart';

part 'BannerListModel.freezed.dart';
part 'BannerListModel.g.dart';


@freezed
class BannerListModel with _$BannerListModel {
  factory BannerListModel({
    required String status,
    required int code,
    required String message,
    List<BannerModel>? data,
  }) = _BannerListModel;

  factory BannerListModel.fromJson(JSON json) => _$BannerListModelFromJson(json);
}

