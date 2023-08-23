import 'package:astro_guide/models/support/SupportChatModel.dart';
import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'SupportChatResponseModel.freezed.dart';
part 'SupportChatResponseModel.g.dart';


@freezed
class SupportChatResponseModel with _$SupportChatResponseModel {
  factory SupportChatResponseModel({
    required String status,
    required int code,
    required String message,
    SupportChatModel? data,
    int?m_id
  }) = _SupportChatResponseModel;

  factory SupportChatResponseModel.fromJson(JSON json) => _$SupportChatResponseModelFromJson(json);
}

