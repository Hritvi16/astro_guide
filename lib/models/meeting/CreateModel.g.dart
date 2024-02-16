// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CreateModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateModelImpl _$$CreateModelImplFromJson(Map<String, dynamic> json) =>
    _$CreateModelImpl(
      code: json['code'] as int,
      status: json['status'] as String,
      message: json['message'] as String,
      token: json['token'] as String?,
      meetingID: json['meetingID'] as String?,
      sessionID: json['sessionID'] as String?,
      meet_id: json['meet_id'] as int?,
      data: json['data'] == null
          ? null
          : SessionHistoryModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CreateModelImplToJson(_$CreateModelImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'message': instance.message,
      'token': instance.token,
      'meetingID': instance.meetingID,
      'sessionID': instance.sessionID,
      'meet_id': instance.meet_id,
      'data': instance.data,
    };
