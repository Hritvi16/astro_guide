import 'package:astro_guide/models/horoscope/basic/BasicKundliModel.dart';
import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'BasicKundliResponseModel.freezed.dart';
part 'BasicKundliResponseModel.g.dart';


@freezed
class BasicKundliResponseModel with _$BasicKundliResponseModel {
  factory BasicKundliResponseModel({
    required String status,
    required int code,
    required String message,
    BasicKundliModel? data,
  }) = _BasicKundliResponseModel;

  factory BasicKundliResponseModel.fromJson(JSON json) => _$BasicKundliResponseModelFromJson(json);
}

