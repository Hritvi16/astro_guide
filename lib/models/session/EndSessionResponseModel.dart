import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'EndSessionResponseModel.freezed.dart';
part 'EndSessionResponseModel.g.dart';


@freezed
class EndSessionResponseModel with _$EndSessionResponseModel {
  factory EndSessionResponseModel({
    required String status,
    required int code,
    required String message,
    int? seconds,
    double? amount,
    double? wallet,
    String? chat_type
  }) = _EndSessionResponseModel;

  factory EndSessionResponseModel.fromJson(JSON json) => _$EndSessionResponseModelFromJson(json);
}

