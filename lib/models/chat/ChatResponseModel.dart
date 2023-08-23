import 'package:astro_guide/models/chat/ChatModel.dart';
import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ChatResponseModel.freezed.dart';
part 'ChatResponseModel.g.dart';


@freezed
class ChatResponseModel with _$ChatResponseModel {
  factory ChatResponseModel({
    required String status,
    required int code,
    required String message,
    ChatModel? data,
    int? m_id,
  }) = _ChatResponseModel;

  factory ChatResponseModel.fromJson(JSON json) => _$ChatResponseModelFromJson(json);
}

