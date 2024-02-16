import 'package:astro_guide/models/horoscope/basic/PayaModel.dart';
import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'BasicKundliModel.freezed.dart';
part 'BasicKundliModel.g.dart';


@freezed
class BasicKundliModel with _$BasicKundliModel {
  factory BasicKundliModel({
  required String full_name,
  required String date,
  required String year,
  required String month,
  required String day,
  required String hour,
  required String minute,
  required String gender,
  required String place,
  required String latitude,
  required String longitude,
  required String timezone,
  required String sunrise,
  required String sunset,
  required String tithi,
  required String paksha,
  required PayaModel paya,
  required String sunsign,
  required String moonsign,
  required String rashi_akshar,
  required String chandramasa,
  required String tatva,
  required int prahar,
  required String nakshatra,
  required String vaar,
  required String varna,
  required String vashya,
  required String yoni,
  required String gana,
  required String nadi,
  }) = _BasicKundliModel;

  factory BasicKundliModel.fromJson(JSON json) => _$BasicKundliModelFromJson(json);
}
