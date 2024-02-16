// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'NotificationModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationModelImpl _$$NotificationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationModelImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      noti: json['noti'] as String,
      image: json['image'] as String,
      noti_date: json['noti_date'] as String,
      created_date: json['created_date'] as String,
    );

Map<String, dynamic> _$$NotificationModelImplToJson(
        _$NotificationModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'noti': instance.noti,
      'image': instance.image,
      'noti_date': instance.noti_date,
      'created_date': instance.created_date,
    };
