// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'NotificationListModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotificationListModel _$$_NotificationListModelFromJson(
        Map<String, dynamic> json) =>
    _$_NotificationListModel(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
      notifications: (json['notifications'] as List<dynamic>)
          .map((e) => NotificationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_NotificationListModelToJson(
        _$_NotificationListModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'notifications': instance.notifications,
    };
