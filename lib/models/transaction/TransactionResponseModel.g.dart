// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TransactionResponseModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionResponseModelImpl _$$TransactionResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionResponseModelImpl(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
      id: json['id'] as int?,
      transaction_id: json['transaction_id'] as String?,
      body: json['body'] as String?,
      checksum: json['checksum'] as String?,
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
    };
