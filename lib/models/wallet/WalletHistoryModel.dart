import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'WalletHistoryModel.freezed.dart';
part 'WalletHistoryModel.g.dart';


@freezed
class WalletHistoryModel with _$WalletHistoryModel {
  factory WalletHistoryModel({
    required int id,
    int? user_id,
    int? astro_id,
    String? order_id,
    String? invoice_id,
    String? transaction_id,
    int? p_id,
    required double amount,
    required double wallet_amount,
    required String type,
    required String t_type,
    required String description,
    required String created_at,
    String? updated_at,
    required int status,
  }) = _WalletHistoryModel;

  factory WalletHistoryModel.fromJson(JSON json) => _$WalletHistoryModelFromJson(json);
}

