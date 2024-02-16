import 'package:astro_guide/models/horoscope/vimshottari/VimMahaDashaDateModel.dart';
import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'VimMahaDashaModel.freezed.dart';
part 'VimMahaDashaModel.g.dart';


@freezed
class VimMahaDashaModel with _$VimMahaDashaModel {
  factory VimMahaDashaModel({
  required VimMahaDashaDateModel Mars,
  required VimMahaDashaDateModel Rahu,
  required VimMahaDashaDateModel Jupiter,
  required VimMahaDashaDateModel Saturn,
  required VimMahaDashaDateModel Mercury,
  required VimMahaDashaDateModel Ketu,
  required VimMahaDashaDateModel Venus,
  required VimMahaDashaDateModel Sun,
  required VimMahaDashaDateModel Moon,
  }) = _VimMahaDashaModel;

  factory VimMahaDashaModel.fromJson(JSON json) => _$VimMahaDashaModelFromJson(json);
}
