import 'package:astro_guide/models/package/PackageModel.dart';
import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'PackageListModel.freezed.dart';
part 'PackageListModel.g.dart';


@freezed
class PackageListModel with _$PackageListModel {
  factory PackageListModel({
    required String status,
    required int code,
    required String message,
    List<PackageModel>? data,
  }) = _PackageListModel;

  factory PackageListModel.fromJson(JSON json) => _$PackageListModelFromJson(json);
}

