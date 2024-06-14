// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SessionResponseModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SessionResponseModelImpl _$$SessionResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SessionResponseModelImpl(
      status: json['status'] as String,
      code: (json['code'] as num).toInt(),
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
      gift: (json['gift'] as num?)?.toInt(),
      rose: (json['rose'] as num?)?.toInt(),
      token_status: (json['token_status'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$SessionResponseModelImplToJson(
        _$SessionResponseModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'astrologer': instance.astrologer,
      'session_history': instance.session_history,
      'wallet': instance.wallet,
      'gift': instance.gift,
      'rose': instance.rose,
      'token_status': instance.token_status,
    };
