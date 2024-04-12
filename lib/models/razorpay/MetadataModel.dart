import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'MetadataModel.freezed.dart';
part 'MetadataModel.g.dart';


@freezed
class MetadataModel with _$MetadataModel {
  factory MetadataModel({
    String? payment_id,
    String? order_id,

  }) = _MetadataModel;

  factory MetadataModel.fromJson(JSON json) => _$MetadataModelFromJson(json);
}
