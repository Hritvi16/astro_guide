import 'package:astro_guide/models/relation/RelationModel.dart';
import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'RelationListModel.freezed.dart';
part 'RelationListModel.g.dart';


@freezed
class RelationListModel with _$RelationListModel {
  factory RelationListModel({
    required String status,
    required int code,
    required String message,
    required List<RelationModel> data,
  }) = _RelationListModel;

  factory RelationListModel.fromJson(JSON json) => _$RelationListModelFromJson(json);
}

