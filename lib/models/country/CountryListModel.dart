import 'package:astro_guide/models/country/CountryModel.dart';
import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'CountryListModel.freezed.dart';
part 'CountryListModel.g.dart';


@freezed
class CountryListModel with _$CountryListModel {
  factory CountryListModel({
    required String status,
    required int code,
    required String message,
    required List<CountryModel> data,
  }) = _CountryListModel;

  factory CountryListModel.fromJson(JSON json) => _$CountryListModelFromJson(json);
}

