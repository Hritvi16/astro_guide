import 'package:astro_guide/models/horoscope/yogini/YogMahaDashaModel.dart';
import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'YoginiDashaModel.freezed.dart';
part 'YoginiDashaModel.g.dart';


@freezed
class YoginiDashaModel with _$YoginiDashaModel {
  factory YoginiDashaModel({
  required String date,
  required String time,
  required List<YogMahaDashaModel> maha_dasha,
  }) = _YoginiDashaModel;

  factory YoginiDashaModel.fromJson(JSON json) => _$YoginiDashaModelFromJson(json);
}
