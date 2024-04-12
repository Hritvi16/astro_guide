import 'package:astro_guide/models/razorpay/ErrorModel.dart';
import 'package:astro_guide/models/razorpay/SuccessModel.dart';
import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'PaymentResponseModel.freezed.dart';
part 'PaymentResponseModel.g.dart';


@freezed
class PaymentResponseModel with _$PaymentResponseModel {
  factory PaymentResponseModel({
    required String status,
    int? code,
    ErrorModel? error,
    SuccessModel? success,
  }) = _PaymentResponseModel;

  factory PaymentResponseModel.fromJson(JSON json) => _$PaymentResponseModelFromJson(json);
}
