// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'WalletHistoryModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WalletHistoryModelImpl _$$WalletHistoryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$WalletHistoryModelImpl(
      id: (json['id'] as num).toInt(),
      user_id: (json['user_id'] as num?)?.toInt(),
      astro_id: (json['astro_id'] as num?)?.toInt(),
      order_id: json['order_id'] as String?,
      invoice_id: json['invoice_id'] as String?,
      transaction_id: json['transaction_id'] as String?,
      p_id: (json['p_id'] as num?)?.toInt(),
      amount: (json['amount'] as num).toDouble(),
      wallet_amount: (json['wallet_amount'] as num).toDouble(),
      type: json['type'] as String,
      t_type: json['t_type'] as String,
      description: json['description'] as String,
      created_at: json['created_at'] as String,
      updated_at: json['updated_at'] as String?,
      status: (json['status'] as num).toInt(),
    );

Map<String, dynamic> _$$WalletHistoryModelImplToJson(
        _$WalletHistoryModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'astro_id': instance.astro_id,
      'order_id': instance.order_id,
      'invoice_id': instance.invoice_id,
      'transaction_id': instance.transaction_id,
      'p_id': instance.p_id,
      'amount': instance.amount,
      'wallet_amount': instance.wallet_amount,
      'type': instance.type,
      't_type': instance.t_type,
      'description': instance.description,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'status': instance.status,
    };
