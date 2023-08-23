import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'HoroscopeModel.freezed.dart';
part 'HoroscopeModel.g.dart';


@freezed
class HoroscopeModel with _$HoroscopeModel {
  factory HoroscopeModel({
    required int id,
  }) = _HoroscopeModel;

  factory HoroscopeModel.fromJson(JSON json) => _$HoroscopeModelFromJson(json);
}
