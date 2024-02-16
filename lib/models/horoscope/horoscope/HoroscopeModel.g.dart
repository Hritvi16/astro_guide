// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HoroscopeModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HoroscopeModelImpl _$$HoroscopeModelImplFromJson(Map<String, dynamic> json) =>
    _$HoroscopeModelImpl(
      sign: json['sign'] as String,
      prediction:
          PredictionModel.fromJson(json['prediction'] as Map<String, dynamic>),
      special: SpecialModel.fromJson(json['special'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$HoroscopeModelImplToJson(
        _$HoroscopeModelImpl instance) =>
    <String, dynamic>{
      'sign': instance.sign,
      'prediction': instance.prediction,
      'special': instance.special,
    };
