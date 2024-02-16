// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AstrologerListModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AstrologerListModelImpl _$$AstrologerListModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AstrologerListModelImpl(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => AstrologerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AstrologerListModelImplToJson(
        _$AstrologerListModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
