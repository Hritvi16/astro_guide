// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TransactionResponseModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransactionResponseModel _$$_TransactionResponseModelFromJson(
        Map<String, dynamic> json) =>
    _$_TransactionResponseModel(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
      id: json['id'] as int?,
      transaction_id: json['transaction_id'] as String?,
    );

Map<String, dynamic> _$$_TransactionResponseModelToJson(
        _$_TransactionResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'id': instance.id,
      'transaction_id': instance.transaction_id,
    };
