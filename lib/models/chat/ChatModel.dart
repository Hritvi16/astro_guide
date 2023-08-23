import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ChatModel.freezed.dart';
part 'ChatModel.g.dart';


@freezed
class ChatModel with _$ChatModel {
  factory ChatModel({
    required int id,
    required int ch_id,
    required String message,
    // required int user_id,
    // required int astro_id,
    required String sender,
    required String type,
    required String m_type,
    required String sent_at,
    String? received_at,
    String? seen_at,
  int? error
  }) = _ChatModel;

  factory ChatModel.fromJson(JSON json) => _$ChatModelFromJson(json);
}
