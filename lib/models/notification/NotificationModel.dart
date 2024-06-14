import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'NotificationModel.freezed.dart';
part 'NotificationModel.g.dart';

@freezed
class NotificationModel with _$NotificationModel {
  factory NotificationModel.fromJson(JSON json) => _$NotificationModelFromJson(json);

  factory NotificationModel({
    required int id,
    required String type,
    required String title,
    required String description,
    String? image,
    // required String noti_date,
    required String created_at,
  }) = _NotificationModel;
}
