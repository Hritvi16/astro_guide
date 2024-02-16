import 'package:astro_guide/models/horoscope/ashtakoot/AshtakootMilanModel.dart';
import 'package:astro_guide/models/horoscope/ashtakoot/AshtakootMilanResultModel.dart';
import 'package:astro_guide/models/horoscope/ashtakoot/ManglikDoshaModel.dart';
import 'package:astro_guide/models/horoscope/basic/PayaModel.dart';
import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'AshtakootModel.freezed.dart';
part 'AshtakootModel.g.dart';


@freezed
class AshtakootModel with _$AshtakootModel {
  factory AshtakootModel({
  required Map<String, AshtakootMilanModel> ashtakoot_milan,
  // required AshtakootMilanModel varna,
  // required AshtakootMilanModel vashya,
  // required AshtakootMilanModel tara,
  // required AshtakootMilanModel yoni,
  // required AshtakootMilanModel graha_maitri,
  // required AshtakootMilanModel gana,
  // required AshtakootMilanModel bhakoota,
  // required AshtakootMilanModel nadi,
  required AshtakootMilanResultModel ashtakoot_milan_result,
  required ManglikDoshaModel manglik_dosha,
  required String nadi_dosha,
  required String bhakoot_dosha,
  }) = _AshtakootModel;

  factory AshtakootModel.fromJson(JSON json) => _$AshtakootModelFromJson(json);
}
