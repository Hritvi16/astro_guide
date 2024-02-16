// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SpecListModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SpecListModelImpl _$$SpecListModelImplFromJson(Map<String, dynamic> json) =>
    _$SpecListModelImpl(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => SpecModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SpecListModelImplToJson(_$SpecListModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
