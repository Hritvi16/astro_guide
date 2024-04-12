import 'package:astro_guide/models/razorpay/MetadataModel.dart';
import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ErrorModel.freezed.dart';
part 'ErrorModel.g.dart';


@freezed
class ErrorModel with _$ErrorModel {
  factory ErrorModel({
    String? code,
    String? description,
    String? source,
    String? step,
    String? reason,
    MetadataModel? metadata,
  }) = _ErrorModel;

  factory ErrorModel.fromJson(JSON json) => _$ErrorModelFromJson(json);
}
