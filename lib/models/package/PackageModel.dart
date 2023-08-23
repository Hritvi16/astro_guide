import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'PackageModel.freezed.dart';
part 'PackageModel.g.dart';


@freezed
class PackageModel with _$PackageModel {
  factory PackageModel({
    required int id,
    required String title,
    required String description,
    int? discount,
    String? type,
    required int amount,
  }) = _PackageModel;

  factory PackageModel.fromJson(JSON json) => _$PackageModelFromJson(json);
}
