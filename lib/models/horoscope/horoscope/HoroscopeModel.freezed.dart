// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'HoroscopeModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HoroscopeModel _$HoroscopeModelFromJson(Map<String, dynamic> json) {
  return _HoroscopeModel.fromJson(json);
}

/// @nodoc
mixin _$HoroscopeModel {
  String get sign => throw _privateConstructorUsedError;
  PredictionModel get prediction => throw _privateConstructorUsedError;
  SpecialModel get special => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HoroscopeModelCopyWith<HoroscopeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HoroscopeModelCopyWith<$Res> {
  factory $HoroscopeModelCopyWith(
          HoroscopeModel value, $Res Function(HoroscopeModel) then) =
      _$HoroscopeModelCopyWithImpl<$Res, HoroscopeModel>;
  @useResult
  $Res call({String sign, PredictionModel prediction, SpecialModel special});

  $PredictionModelCopyWith<$Res> get prediction;
  $SpecialModelCopyWith<$Res> get special;
}

/// @nodoc
class _$HoroscopeModelCopyWithImpl<$Res, $Val extends HoroscopeModel>
    implements $HoroscopeModelCopyWith<$Res> {
  _$HoroscopeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sign = null,
    Object? prediction = null,
    Object? special = null,
  }) {
    return _then(_value.copyWith(
      sign: null == sign
          ? _value.sign
          : sign // ignore: cast_nullable_to_non_nullable
              as String,
      prediction: null == prediction
          ? _value.prediction
          : prediction // ignore: cast_nullable_to_non_nullable
              as PredictionModel,
      special: null == special
          ? _value.special
          : special // ignore: cast_nullable_to_non_nullable
              as SpecialModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PredictionModelCopyWith<$Res> get prediction {
    return $PredictionModelCopyWith<$Res>(_value.prediction, (value) {
      return _then(_value.copyWith(prediction: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SpecialModelCopyWith<$Res> get special {
    return $SpecialModelCopyWith<$Res>(_value.special, (value) {
      return _then(_value.copyWith(special: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HoroscopeModelImplCopyWith<$Res>
    implements $HoroscopeModelCopyWith<$Res> {
  factory _$$HoroscopeModelImplCopyWith(_$HoroscopeModelImpl value,
          $Res Function(_$HoroscopeModelImpl) then) =
      __$$HoroscopeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String sign, PredictionModel prediction, SpecialModel special});

  @override
  $PredictionModelCopyWith<$Res> get prediction;
  @override
  $SpecialModelCopyWith<$Res> get special;
}

/// @nodoc
class __$$HoroscopeModelImplCopyWithImpl<$Res>
    extends _$HoroscopeModelCopyWithImpl<$Res, _$HoroscopeModelImpl>
    implements _$$HoroscopeModelImplCopyWith<$Res> {
  __$$HoroscopeModelImplCopyWithImpl(
      _$HoroscopeModelImpl _value, $Res Function(_$HoroscopeModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sign = null,
    Object? prediction = null,
    Object? special = null,
  }) {
    return _then(_$HoroscopeModelImpl(
      sign: null == sign
          ? _value.sign
          : sign // ignore: cast_nullable_to_non_nullable
              as String,
      prediction: null == prediction
          ? _value.prediction
          : prediction // ignore: cast_nullable_to_non_nullable
              as PredictionModel,
      special: null == special
          ? _value.special
          : special // ignore: cast_nullable_to_non_nullable
              as SpecialModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HoroscopeModelImpl implements _HoroscopeModel {
  _$HoroscopeModelImpl(
      {required this.sign, required this.prediction, required this.special});

  factory _$HoroscopeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HoroscopeModelImplFromJson(json);

  @override
  final String sign;
  @override
  final PredictionModel prediction;
  @override
  final SpecialModel special;

  @override
  String toString() {
    return 'HoroscopeModel(sign: $sign, prediction: $prediction, special: $special)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HoroscopeModelImpl &&
            (identical(other.sign, sign) || other.sign == sign) &&
            (identical(other.prediction, prediction) ||
                other.prediction == prediction) &&
            (identical(other.special, special) || other.special == special));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, sign, prediction, special);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HoroscopeModelImplCopyWith<_$HoroscopeModelImpl> get copyWith =>
      __$$HoroscopeModelImplCopyWithImpl<_$HoroscopeModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HoroscopeModelImplToJson(
      this,
    );
  }
}

abstract class _HoroscopeModel implements HoroscopeModel {
  factory _HoroscopeModel(
      {required final String sign,
      required final PredictionModel prediction,
      required final SpecialModel special}) = _$HoroscopeModelImpl;

  factory _HoroscopeModel.fromJson(Map<String, dynamic> json) =
      _$HoroscopeModelImpl.fromJson;

  @override
  String get sign;
  @override
  PredictionModel get prediction;
  @override
  SpecialModel get special;
  @override
  @JsonKey(ignore: true)
  _$$HoroscopeModelImplCopyWith<_$HoroscopeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
