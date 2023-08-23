// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CheckSessionResponseModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CheckSessionResponseModel _$$_CheckSessionResponseModelFromJson(
        Map<String, dynamic> json) =>
    _$_CheckSessionResponseModel(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
      ch_id: json['ch_id'] as int?,
      started_at: json['started_at'] as String?,
      rate: json['rate'] as int?,
      type: json['type'] as String?,
      data: json['data'] == null
          ? null
          : CheckSessionModel.fromJson(json['data'] as Map<String, dynamic>),
      cities: (json['cities'] as List<dynamic>?)
          ?.map((e) => CityModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      kundlis: (json['kundlis'] as List<dynamic>?)
          ?.map((e) => KundliModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      relations: (json['relations'] as List<dynamic>?)
          ?.map((e) => RelationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      wallet: (json['wallet'] as num?)?.toDouble(),
      sess_id: json['sess_id'] as int?,
      session_history: json['session_history'] == null
          ? null
          : SessionHistoryModel.fromJson(
              json['session_history'] as Map<String, dynamic>),
      token: json['token'] as String?,
    );

Map<String, dynamic> _$$_CheckSessionResponseModelToJson(
        _$_CheckSessionResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'ch_id': instance.ch_id,
      'started_at': instance.started_at,
      'rate': instance.rate,
      'type': instance.type,
      'data': instance.data,
      'cities': instance.cities,
      'kundlis': instance.kundlis,
      'relations': instance.relations,
      'wallet': instance.wallet,
      'sess_id': instance.sess_id,
      'session_history': instance.session_history,
      'token': instance.token,
    };
