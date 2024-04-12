// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PaymentModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentModelImpl _$$PaymentModelImplFromJson(Map<String, dynamic> json) =>
    _$PaymentModelImpl(
      id: json['id'] as String,
      entity: json['entity'] as String,
      amount: (json['amount'] as num).toDouble(),
      amount_paid: (json['amount_paid'] as num).toDouble(),
      amount_due: (json['amount_due'] as num).toDouble(),
      currency: json['currency'] as String,
      receipt: json['receipt'] as String,
      offer_id: json['offer_id'] as int?,
      status: json['status'] as String,
      created_at: json['created_at'] as int,
    );

Map<String, dynamic> _$$PaymentModelImplToJson(_$PaymentModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'entity': instance.entity,
      'amount': instance.amount,
      'amount_paid': instance.amount_paid,
      'amount_due': instance.amount_due,
      'currency': instance.currency,
      'receipt': instance.receipt,
      'offer_id': instance.offer_id,
      'status': instance.status,
      'created_at': instance.created_at,
    };
