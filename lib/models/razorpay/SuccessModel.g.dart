// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SuccessModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SuccessModelImpl _$$SuccessModelImplFromJson(Map<String, dynamic> json) =>
    _$SuccessModelImpl(
      orderId: json['orderId'] as String?,
      paymentId: json['paymentId'] as String?,
      signature: json['signature'] as String?,
      wallet: json['wallet'] as String?,
    );

Map<String, dynamic> _$$SuccessModelImplToJson(_$SuccessModelImpl instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'paymentId': instance.paymentId,
      'signature': instance.signature,
      'wallet': instance.wallet,
    };
