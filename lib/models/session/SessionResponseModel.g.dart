// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SessionResponseModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SessionResponseModel _$$_SessionResponseModelFromJson(
        Map<String, dynamic> json) =>
    _$_SessionResponseModel(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
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

Map<String, dynamic> _$$_SessionResponseModelToJson(
        _$_SessionResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'astrologer': instance.astrologer,
      'session_history': instance.session_history,
      'wallet': instance.wallet,
    };
