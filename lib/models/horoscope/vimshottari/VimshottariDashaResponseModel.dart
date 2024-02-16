import 'package:astro_guide/models/horoscope/vimshottari/VimshottariDashaModel.dart';
import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'VimshottariDashaResponseModel.freezed.dart';
part 'VimshottariDashaResponseModel.g.dart';


@freezed
class VimshottariDashaResponseModel with _$VimshottariDashaResponseModel {
  factory VimshottariDashaResponseModel({
    required String status,
    required int code,
    required String message,
    VimshottariDashaModel? data,
  }) = _VimshottariDashaResponseModel;

  factory VimshottariDashaResponseModel.fromJson(JSON json) => _$VimshottariDashaResponseModelFromJson(json);
}

