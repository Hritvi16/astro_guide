// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'WalletResponseModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WalletResponseModelImpl _$$WalletResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$WalletResponseModelImpl(
      status: json['status'] as String,
      code: (json['code'] as num).toInt(),
      message: json['message'] as String,
      amount: (json['amount'] as num?)?.toDouble(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => PackageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$WalletResponseModelImplToJson(
        _$WalletResponseModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'amount': instance.amount,
      'data': instance.data,
    };
