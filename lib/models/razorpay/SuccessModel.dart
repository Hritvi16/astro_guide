import 'package:astro_guide/models/razorpay/MetadataModel.dart';
import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'SuccessModel.freezed.dart';
part 'SuccessModel.g.dart';


@freezed
class SuccessModel with _$SuccessModel {
  factory SuccessModel({
    String? orderId,
    String? paymentId,
    String? signature,
    String? wallet,
  }) = _SuccessModel;

  factory SuccessModel.fromJson(JSON json) => _$SuccessModelFromJson(json);
}
