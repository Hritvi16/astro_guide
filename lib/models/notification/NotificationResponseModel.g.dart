// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'NotificationResponseModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationResponseModelImpl _$$NotificationResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationResponseModelImpl(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
      notification: NotificationModel.fromJson(
          json['notification'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$NotificationResponseModelImplToJson(
        _$NotificationResponseModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'notification': instance.notification,
    };
