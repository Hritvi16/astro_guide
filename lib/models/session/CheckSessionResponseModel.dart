import 'package:astro_guide/models/kundli/KundliModel.dart';
import 'package:astro_guide/models/city/CityModel.dart';
import 'package:astro_guide/models/relation/RelationModel.dart';
import 'package:astro_guide/models/session/CheckSessionModel.dart';
import 'package:astro_guide/models/session/SessionHistoryModel.dart';
import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'CheckSessionResponseModel.freezed.dart';
part 'CheckSessionResponseModel.g.dart';


@freezed
class CheckSessionResponseModel with _$CheckSessionResponseModel {
  factory CheckSessionResponseModel({
    required String status,
    required int code,
    required String message,
    int? ch_id,
    String? started_at,
    int? rate,
    String? type,
    CheckSessionModel? data,
    List<CityModel>? cities,
    List<KundliModel>? kundlis,
    List<RelationModel>? relations,
    double? wallet,
    int? sess_id,
    SessionHistoryModel? session_history,
    String? token,
  }) = _CheckSessionResponseModel;

  factory CheckSessionResponseModel.fromJson(JSON json) => _$CheckSessionResponseModelFromJson(json);
}

