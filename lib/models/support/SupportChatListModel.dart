import 'package:astro_guide/models/support/SupportChatModel.dart';
import 'package:astro_guide/models/support/SupportModel.dart';
import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'SupportChatListModel.freezed.dart';
part 'SupportChatListModel.g.dart';


@freezed
class SupportChatListModel with _$SupportChatListModel {
  factory SupportChatListModel({
    required String status,
    required int code,
    required String message,
    List<SupportChatModel>? data,
    SupportModel? support
  }) = _SupportChatListModel;

  factory SupportChatListModel.fromJson(JSON json) => _$SupportChatListModelFromJson(json);
}

