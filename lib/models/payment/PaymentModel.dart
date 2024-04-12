import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'PaymentModel.freezed.dart';
part 'PaymentModel.g.dart';


@freezed
class PaymentModel with _$PaymentModel {
  factory PaymentModel({
    required String id,
    required String entity,
    required double amount,
    required double amount_paid,
    required double amount_due,
    required String currency,
    required String receipt,
    int? offer_id,
    required String status,
    required int created_at,
  }) = _PaymentModel;

  factory PaymentModel.fromJson(JSON json) => _$PaymentModelFromJson(json);
}
