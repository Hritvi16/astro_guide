// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EndSessionResponseModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EndSessionResponseModel _$$_EndSessionResponseModelFromJson(
        Map<String, dynamic> json) =>
    _$_EndSessionResponseModel(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
      seconds: json['seconds'] as int?,
      amount: (json['amount'] as num?)?.toDouble(),
      wallet: (json['wallet'] as num?)?.toDouble(),
      chat_type: json['chat_type'] as String?,
    );

Map<String, dynamic> _$$_EndSessionResponseModelToJson(
        _$_EndSessionResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'seconds': instance.seconds,
      'amount': instance.amount,
      'wallet': instance.wallet,
      'chat_type': instance.chat_type,
    };
