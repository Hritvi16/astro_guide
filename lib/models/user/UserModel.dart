import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'UserModel.freezed.dart';
part 'UserModel.g.dart';


@freezed
class UserModel with _$UserModel {
  factory UserModel({
    required int id,
    required String name,
    String? mobile,
    String? email,
    String? gender,
    String? dob,
    String? profile,
    int? free,
    int? nationality,
    int? ci_id,
    int? st_id,
    int? co_id,
    String? postal_code,
    required String joined_via,
    double? amount
  }) = _UserModel;

  factory UserModel.fromJson(JSON json) => _$UserModelFromJson(json);
}
