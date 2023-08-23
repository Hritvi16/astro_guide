import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'KundliModel.freezed.dart';
part 'KundliModel.g.dart';


@freezed
class KundliModel with _$KundliModel {
  factory KundliModel({
    required int id,
    required int user_id,
    required String name,
    required String dob,
    required String gender,
    int? ci_id,
    required String marital_status,
    required String type,
    int? r_id,
    required String created_at,
    String? updated_at,
    String? city,
    String? state,
    String? country,
    String? relation,
  }) = _KundliModel;

  factory KundliModel.fromJson(JSON json) => _$KundliModelFromJson(json);
}
