import 'package:astro_guide/models/astrologer/AstrologerModel.dart';
import 'package:astro_guide/models/session/SessionHistoryModel.dart';
import 'package:astro_guide/models/chat/ChatModel.dart';
import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'SessionResponseModel.freezed.dart';
part 'SessionResponseModel.g.dart';


@freezed
class SessionResponseModel with _$SessionResponseModel {
  factory SessionResponseModel({
    required String status,
    required int code,
    required String message,
    AstrologerModel? astrologer,
    SessionHistoryModel? session_history,
    double? wallet,
    int? gift,
    int? rose,
    int? token_status,
  }) = _SessionResponseModel;

  factory SessionResponseModel.fromJson(JSON json) => _$SessionResponseModelFromJson(json);
}

