import 'package:astro_guide/models/state/StateModel.dart';
import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'StateListModel.freezed.dart';
part 'StateListModel.g.dart';


@freezed
class StateListModel with _$StateListModel {
  factory StateListModel({
    required String status,
    required int code,
    required String message,
    required List<StateModel> data,
  }) = _StateListModel;

  factory StateListModel.fromJson(JSON json) => _$StateListModelFromJson(json);
}

