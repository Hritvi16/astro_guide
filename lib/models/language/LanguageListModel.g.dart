// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LanguageListModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LanguageListModelImpl _$$LanguageListModelImplFromJson(
        Map<String, dynamic> json) =>
    _$LanguageListModelImpl(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => LanguageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$LanguageListModelImplToJson(
        _$LanguageListModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
