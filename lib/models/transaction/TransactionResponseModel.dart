import 'package:astro_guide/models/package/PackageModel.dart';
import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'TransactionResponseModel.freezed.dart';
part 'TransactionResponseModel.g.dart';


@freezed
class TransactionResponseModel with _$TransactionResponseModel {
  factory TransactionResponseModel({
    required String status,
    required int code,
    required String message,
    int? id,
    String? transaction_id,
    // double? amount,
    // List<PackageModel>? data,
  }) = _TransactionResponseModel;

  factory TransactionResponseModel.fromJson(JSON json) => _$TransactionResponseModelFromJson(json);
}

