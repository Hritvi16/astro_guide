// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SupportChatListModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SupportChatListModelImpl _$$SupportChatListModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SupportChatListModelImpl(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => SupportChatModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      support: json['support'] == null
          ? null
          : SupportModel.fromJson(json['support'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SupportChatListModelImplToJson(
        _$SupportChatListModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
      'support': instance.support,
    };
