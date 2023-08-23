import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'AstrologerModel.freezed.dart';
part 'AstrologerModel.g.dart';


@freezed
class AstrologerModel with _$AstrologerModel {
  factory AstrologerModel({
    required int id,
    required String name,
    required String mobile,
    required String email,
    required double experience,
    required String profile,
    required String about,
    int? fav,
    int? follow,
    int? followers,
    int? favourite,
    int? p_call,
    int? p_chat,
    int? f_call,
    int? f_chat,
    int? offer,
    int? free,
    int? online,
    double? rating,
    int? total_rating,
    int? reviews,
    String? country,
    String? state,
    String? city,
    int? total_chat_sec,
    int? total_call_sec,
    double? total_chat_rating,
    double? total_call_rating,
  }) = _AstrologerModel;

  factory AstrologerModel.fromJson(JSON json) => _$AstrologerModelFromJson(json);
}
