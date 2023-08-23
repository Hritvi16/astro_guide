import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'StateModel.freezed.dart';
part 'StateModel.g.dart';


@freezed
class StateModel with _$StateModel {
  factory StateModel({
    required int id,
    required String name,
    required int co_id,
  }) = _StateModel;

  factory StateModel.fromJson(JSON json) => _$StateModelFromJson(json);
}
