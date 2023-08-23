import 'package:astro_guide/models/package/PackageModel.dart';
import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'WalletResponseModel.freezed.dart';
part 'WalletResponseModel.g.dart';


@freezed
class WalletResponseModel with _$WalletResponseModel {
  factory WalletResponseModel({
    required String status,
    required int code,
    required String message,
    double? amount,
    List<PackageModel>? data,
  }) = _WalletResponseModel;

  factory WalletResponseModel.fromJson(JSON json) => _$WalletResponseModelFromJson(json);
}

