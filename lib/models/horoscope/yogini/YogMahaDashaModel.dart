import 'package:astro_guide/models/horoscope/yogini/YogAntarDashaModel.dart';
import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'YogMahaDashaModel.freezed.dart';
part 'YogMahaDashaModel.g.dart';


@freezed
class YogMahaDashaModel with _$YogMahaDashaModel {
  factory YogMahaDashaModel({
  required String dasha,
  required String start_date,
  required String end_date,
  required YogAntarDashaModel antar_dasha,
  }) = _YogMahaDashaModel;

  factory YogMahaDashaModel.fromJson(JSON json) => _$YogMahaDashaModelFromJson(json);
}
