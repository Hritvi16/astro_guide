import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'SupportResponseModel.freezed.dart';
part 'SupportResponseModel.g.dart';


@freezed
class SupportResponseModel with _$SupportResponseModel {
  factory SupportResponseModel({
    required String status,
    required int code,
    required String message,
    int? id,
  }) = _SupportResponseModel;

  factory SupportResponseModel.fromJson(JSON json) => _$SupportResponseModelFromJson(json);
}

