import 'package:astro_guide/models/horoscope/basic/PayaModel.dart';
import 'package:astro_guide/models/horoscope/vimshottari/VimMahaDashaModel.dart';
import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'VimMahaDashaDateModel.freezed.dart';
part 'VimMahaDashaDateModel.g.dart';


@freezed
class VimMahaDashaDateModel with _$VimMahaDashaDateModel {
  factory VimMahaDashaDateModel({
    String? start_date,
    String? end_date,
    String? start_time,
    String? end_time,
    VimMahaDashaModel? antar_dasha,
    VimMahaDashaModel? pratyantar_dasha,
  }) = _VimMahaDashaDateModel;

  factory VimMahaDashaDateModel.fromJson(JSON json) => _$VimMahaDashaDateModelFromJson(json);
}
