import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'RelationModel.freezed.dart';
part 'RelationModel.g.dart';


@freezed
class RelationModel with _$RelationModel {
  factory RelationModel({
    required int id,
    required String name,
  }) = _RelationModel;

  factory RelationModel.fromJson(JSON json) => _$RelationModelFromJson(json);
}
