import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'YogAntarDashaModel.freezed.dart';
part 'YogAntarDashaModel.g.dart';


@freezed
class YogAntarDashaModel with _$YogAntarDashaModel {
  factory YogAntarDashaModel({
  required String Siddha,
  required String Sankata,
  required String Mangala,
  required String Pingala,
  required String Dhanya,
  required String Bhramari,
  required String Bhadrika,
  required String Ulka,
  }) = _YogAntarDashaModel;

  factory YogAntarDashaModel.fromJson(JSON json) => _$YogAntarDashaModelFromJson(json);
}
