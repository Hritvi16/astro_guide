// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SessionListModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SessionListModelImpl _$$SessionListModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SessionListModelImpl(
      status: json['status'] as String,
      code: (json['code'] as num).toInt(),
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
      gift: (json['gift'] as num?)?.toInt(),
      rose: (json['rose'] as num?)?.toInt(),
      token_status: (json['token_status'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$SessionListModelImplToJson(
        _$SessionListModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
      'astrologer': instance.astrologer,
      'session_history': instance.session_history,
      'wallet': instance.wallet,
      'gift': instance.gift,
      'rose': instance.rose,
      'token_status': instance.token_status,
    };
