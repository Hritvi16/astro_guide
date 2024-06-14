// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TransactionResponseModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionResponseModelImpl _$$TransactionResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionResponseModelImpl(
      status: json['status'] as String,
      code: (json['code'] as num).toInt(),
      message: json['message'] as String,
      id: (json['id'] as num?)?.toInt(),
      transaction_id: json['transaction_id'] as String?,
      body: json['body'] as String?,
      checksum: json['checksum'] as String?,
      payment: json['payment'] == null
          ? null
          : PaymentModel.fromJson(json['payment'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TransactionResponseModelImplToJson(
        _$TransactionResponseModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'id': instance.id,
      'transaction_id': instance.transaction_id,
      'body': instance.body,
      'checksum': instance.checksum,
      'payment': instance.payment,
    };
