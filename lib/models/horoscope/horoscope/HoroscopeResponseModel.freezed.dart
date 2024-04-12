// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'HoroscopeResponseModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HoroscopeResponseModel _$HoroscopeResponseModelFromJson(
    Map<String, dynamic> json) {
  return _HoroscopeResponseModel.fromJson(json);
}

/// @nodoc
mixin _$HoroscopeResponseModel {
  String get status => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  HoroscopeModel? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HoroscopeResponseModelCopyWith<HoroscopeResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HoroscopeResponseModelCopyWith<$Res> {
  factory $HoroscopeResponseModelCopyWith(HoroscopeResponseModel value,
          $Res Function(HoroscopeResponseModel) then) =
      _$HoroscopeResponseModelCopyWithImpl<$Res, HoroscopeResponseModel>;
  @useResult
  $Res call({String status, int code, String message, HoroscopeModel? data});

  $HoroscopeModelCopyWith<$Res>? get data;
}

/// @nodoc
class _$HoroscopeResponseModelCopyWithImpl<$Res,
        $Val extends HoroscopeResponseModel>
    implements $HoroscopeResponseModelCopyWith<$Res> {
  _$HoroscopeResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as HoroscopeModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $HoroscopeModelCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $HoroscopeModelCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HoroscopeResponseModelImplCopyWith<$Res>
    implements $HoroscopeResponseModelCopyWith<$Res> {
  factory _$$HoroscopeResponseModelImplCopyWith(
          _$HoroscopeResponseModelImpl value,
          $Res Function(_$HoroscopeResponseModelImpl) then) =
      __$$HoroscopeResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, int code, String message, HoroscopeModel? data});

  @override
  $HoroscopeModelCopyWith<$Res>? get data;
}

/// @nodoc
class __$$HoroscopeResponseModelImplCopyWithImpl<$Res>
    extends _$HoroscopeResponseModelCopyWithImpl<$Res,
        _$HoroscopeResponseModelImpl>
    implements _$$HoroscopeResponseModelImplCopyWith<$Res> {
  __$$HoroscopeResponseModelImplCopyWithImpl(
      _$HoroscopeResponseModelImpl _value,
      $Res Function(_$HoroscopeResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_$HoroscopeResponseModelImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as HoroscopeModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HoroscopeResponseModelImpl implements _HoroscopeResponseModel {
  _$HoroscopeResponseModelImpl(
      {required this.status,
      required this.code,
      required this.message,
      this.data});

  factory _$HoroscopeResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HoroscopeResponseModelImplFromJson(json);

  @override
  final String status;
  @override
  final int code;
  @override
  final String message;
  @override
  final HoroscopeModel? data;

  @override
  String toString() {
    return 'HoroscopeResponseModel(status: $status, code: $code, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HoroscopeResponseModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, code, message, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HoroscopeResponseModelImplCopyWith<_$HoroscopeResponseModelImpl>
      get copyWith => __$$HoroscopeResponseModelImplCopyWithImpl<
          _$HoroscopeResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HoroscopeResponseModelImplToJson(
      this,
    );
  }
}

abstract class _HoroscopeResponseModel implements HoroscopeResponseModel {
  factory _HoroscopeResponseModel(
      {required final String status,
      required final int code,
      required final String message,
      final HoroscopeModel? data}) = _$HoroscopeResponseModelImpl;

  factory _HoroscopeResponseModel.fromJson(Map<String, dynamic> json) =
      _$HoroscopeResponseModelImpl.fromJson;

  @override
  String get status;
  @override
  int get code;
  @override
  String get message;
  @override
  HoroscopeModel? get data;
  @override
  @JsonKey(ignore: true)
  _$$HoroscopeResponseModelImplCopyWith<_$HoroscopeResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
