import 'package:astro_guide/models/notification/NotificationModel.dart';
import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'NotificationListModel.freezed.dart';
part 'NotificationListModel.g.dart';

@freezed
class NotificationListModel with _$NotificationListModel {
  factory NotificationListModel.fromJson(JSON json) => _$NotificationListModelFromJson(json);

  factory NotificationListModel({
    required String status,
    required int code,
    required String message,
    List<NotificationModel>? data,
  }) = _NotificationListModel;
}
