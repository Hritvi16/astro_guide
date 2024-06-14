import 'package:astro_guide/models/horoscope/horoscope/HoroscopeModel.dart';
import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'HoroscopeTimeModel.freezed.dart';
part 'HoroscopeTimeModel.g.dart';


@freezed
class HoroscopeTimeModel with _$HoroscopeTimeModel {
  factory HoroscopeTimeModel({
    required HoroscopeModel current,
    required HoroscopeModel prev,
    required HoroscopeModel next,
  }) = _HoroscopeTimeModel;

  factory HoroscopeTimeModel.fromJson(JSON json) => _$HoroscopeTimeModelFromJson(json);
}

