// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      id: json['id'] as int,
      name: json['name'] as String,
      mobile: json['mobile'] as String,
      email: json['email'] as String?,
      gender: json['gender'] as String?,
      dob: json['dob'] as String?,
      profile: json['profile'] as String?,
      free: json['free'] as int?,
      nationality: json['nationality'] as int?,
      ci_id: json['ci_id'] as int?,
      st_id: json['st_id'] as int?,
      co_id: json['co_id'] as int?,
      postal_code: json['postal_code'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'mobile': instance.mobile,
      'email': instance.email,
      'gender': instance.gender,
      'dob': instance.dob,
      'profile': instance.profile,
      'free': instance.free,
      'nationality': instance.nationality,
      'ci_id': instance.ci_id,
      'st_id': instance.st_id,
      'co_id': instance.co_id,
      'postal_code': instance.postal_code,
      'amount': instance.amount,
    };
