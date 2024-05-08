import 'package:astro_guide/models/horoscope/numeroscope/NumeroscopeModel.dart';
import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'NumeroscopeResponseModel.freezed.dart';
part 'NumeroscopeResponseModel.g.dart';


@freezed
class NumeroscopeResponseModel with _$NumeroscopeResponseModel {
  factory NumeroscopeResponseModel({
    required String status,
    required int code,
    required String message,
    String? data,
  }) = _NumeroscopeResponseModel;

  factory NumeroscopeResponseModel.fromJson(JSON json) => _$NumeroscopeResponseModelFromJson(json);
}

