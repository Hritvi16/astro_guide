// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'NotificationModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotificationModel _$$_NotificationModelFromJson(Map<String, dynamic> json) =>
    _$_NotificationModel(
      id: json['id'] as String,
      title: json['title'] as String,
      noti: json['noti'] as String,
      image: json['image'] as String,
      noti_date: json['noti_date'] as String,
      created_date: json['created_date'] as String,
    );

Map<String, dynamic> _$$_NotificationModelToJson(
        _$_NotificationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'noti': instance.noti,
      'image': instance.image,
      'noti_date': instance.noti_date,
      'created_date': instance.created_date,
    };
