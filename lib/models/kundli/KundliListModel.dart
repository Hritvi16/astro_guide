import 'package:astro_guide/models/kundli/KundliModel.dart';
import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'KundliListModel.freezed.dart';
part 'KundliListModel.g.dart';


@freezed
class KundliListModel with _$KundliListModel {
  factory KundliListModel({
    required String status,
    required int code,
    required String message,
    List<KundliModel>? data,
  }) = _KundliListModel;

  factory KundliListModel.fromJson(JSON json) => _$KundliListModelFromJson(json);
}

