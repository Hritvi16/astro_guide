// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EndSessionResponseModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EndSessionResponseModelImpl _$$EndSessionResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EndSessionResponseModelImpl(
      status: json['status'] as String,
      code: (json['code'] as num).toInt(),
      message: json['message'] as String,
      seconds: (json['seconds'] as num?)?.toInt(),
      amount: (json['amount'] as num?)?.toDouble(),
      wallet: (json['wallet'] as num?)?.toDouble(),
      chat_type: json['chat_type'] as String?,
      gift: (json['gift'] as num?)?.toInt(),
      rose: (json['rose'] as num?)?.toInt(),
      token_status: (json['token_status'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$EndSessionResponseModelImplToJson(
        _$EndSessionResponseModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'seconds': instance.seconds,
      'amount': instance.amount,
      'wallet': instance.wallet,
      'chat_type': instance.chat_type,
      'gift': instance.gift,
      'rose': instance.rose,
      'token_status': instance.token_status,
    };
