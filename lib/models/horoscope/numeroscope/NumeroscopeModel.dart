import 'package:astro_guide/shared/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'NumeroscopeModel.freezed.dart';
part 'NumeroscopeModel.g.dart';


@freezed
class NumeroscopeModel with _$NumeroscopeModel {
  factory NumeroscopeModel({
    required String data,
  }) = _NumeroscopeModel;

  factory NumeroscopeModel.fromJson(JSON json) => _$NumeroscopeModelFromJson(json);
}
