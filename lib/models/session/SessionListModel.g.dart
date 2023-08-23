// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SessionListModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SessionListModel _$$_SessionListModelFromJson(Map<String, dynamic> json) =>
    _$_SessionListModel(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ChatModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      astrologer: json['astrologer'] == null
          ? null
          : AstrologerModel.fromJson(
              json['astrologer'] as Map<String, dynamic>),
      session_history: json['session_history'] == null
          ? null
          : SessionHistoryModel.fromJson(
              json['session_history'] as Map<String, dynamic>),
      wallet: (json['wallet'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_SessionListModelToJson(_$_SessionListModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
      'astrologer': instance.astrologer,
      'session_history': instance.session_history,
      'wallet': instance.wallet,
    };
