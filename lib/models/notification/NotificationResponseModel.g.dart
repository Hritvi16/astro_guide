// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'NotificationResponseModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotificationResponseModel _$$_NotificationResponseModelFromJson(
        Map<String, dynamic> json) =>
    _$_NotificationResponseModel(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
      notification: NotificationModel.fromJson(
          json['notification'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_NotificationResponseModelToJson(
        _$_NotificationResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'notification': instance.notification,
    };
