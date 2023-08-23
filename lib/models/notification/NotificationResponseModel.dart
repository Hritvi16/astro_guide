import 'package:astro_guide/models/notification/NotificationModel.dart';
import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'NotificationResponseModel.freezed.dart';
part 'NotificationResponseModel.g.dart';

@freezed
class NotificationResponseModel with _$NotificationResponseModel {
  factory NotificationResponseModel.fromJson(JSON json) => _$NotificationResponseModelFromJson(json);

  factory NotificationResponseModel({
    required String status,
    required int code,
    required String message,
    required NotificationModel notification,
  }) = _NotificationResponseModel;
}
