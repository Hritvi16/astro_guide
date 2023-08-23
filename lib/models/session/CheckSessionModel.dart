import 'package:astro_guide/models/package/PackageModel.dart';
import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'CheckSessionModel.freezed.dart';
part 'CheckSessionModel.g.dart';


@freezed
class CheckSessionModel with _$CheckSessionModel {
  factory CheckSessionModel({
    required String name,
    required String mobile,
    required String gender,
    required String dob,
    int? ci_id,
    String? marital_status,
    String? type,
    required String info,
  }) = _CheckSessionModel;

  factory CheckSessionModel.fromJson(JSON json) => _$CheckSessionModelFromJson(json);
}

