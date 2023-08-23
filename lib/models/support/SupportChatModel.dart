import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'SupportChatModel.freezed.dart';
part 'SupportChatModel.g.dart';


@freezed
class SupportChatModel with _$SupportChatModel {
  factory SupportChatModel({
    required int id,
    required int sup_id,
    required String sender,
    required String message,
    required String sent_at,
    String? seen_at,
    int? error,
  }) = _SupportChatModel;

  factory SupportChatModel.fromJson(JSON json) => _$SupportChatModelFromJson(json);
}
