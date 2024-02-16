// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HistoryModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HistoryModelImpl _$$HistoryModelImplFromJson(Map<String, dynamic> json) =>
    _$HistoryModelImpl(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
      amount: (json['amount'] as num?)?.toDouble(),
      wallet: (json['wallet'] as List<dynamic>?)
          ?.map((e) => WalletHistoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      payment: (json['payment'] as List<dynamic>?)
          ?.map((e) => WalletHistoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      call: (json['call'] as List<dynamic>?)
          ?.map((e) => SessionHistoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      chat: (json['chat'] as List<dynamic>?)
          ?.map((e) => SessionHistoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$HistoryModelImplToJson(_$HistoryModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'amount': instance.amount,
      'wallet': instance.wallet,
      'payment': instance.payment,
      'call': instance.call,
      'chat': instance.chat,
    };
