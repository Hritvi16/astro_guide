// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'PaymentResponseModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaymentResponseModel _$PaymentResponseModelFromJson(Map<String, dynamic> json) {
  return _PaymentResponseModel.fromJson(json);
}

/// @nodoc
mixin _$PaymentResponseModel {
  String get status => throw _privateConstructorUsedError;
  int? get code => throw _privateConstructorUsedError;
  ErrorModel? get error => throw _privateConstructorUsedError;
  SuccessModel? get success => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentResponseModelCopyWith<PaymentResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentResponseModelCopyWith<$Res> {
  factory $PaymentResponseModelCopyWith(PaymentResponseModel value,
          $Res Function(PaymentResponseModel) then) =
      _$PaymentResponseModelCopyWithImpl<$Res, PaymentResponseModel>;
  @useResult
  $Res call(
      {String status, int? code, ErrorModel? error, SuccessModel? success});

  $ErrorModelCopyWith<$Res>? get error;
  $SuccessModelCopyWith<$Res>? get success;
}

/// @nodoc
class _$PaymentResponseModelCopyWithImpl<$Res,
        $Val extends PaymentResponseModel>
    implements $PaymentResponseModelCopyWith<$Res> {
  _$PaymentResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = freezed,
    Object? error = freezed,
    Object? success = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ErrorModel?,
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as SuccessModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ErrorModelCopyWith<$Res>? get error {
    if (_value.error == null) {
      return null;
    }

    return $ErrorModelCopyWith<$Res>(_value.error!, (value) {
      return _then(_value.copyWith(error: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SuccessModelCopyWith<$Res>? get success {
    if (_value.success == null) {
      return null;
    }

    return $SuccessModelCopyWith<$Res>(_value.success!, (value) {
      return _then(_value.copyWith(success: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PaymentResponseModelImplCopyWith<$Res>
    implements $PaymentResponseModelCopyWith<$Res> {
  factory _$$PaymentResponseModelImplCopyWith(_$PaymentResponseModelImpl value,
          $Res Function(_$PaymentResponseModelImpl) then) =
      __$$PaymentResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String status, int? code, ErrorModel? error, SuccessModel? success});

  @override
  $ErrorModelCopyWith<$Res>? get error;
  @override
  $SuccessModelCopyWith<$Res>? get success;
}

/// @nodoc
class __$$PaymentResponseModelImplCopyWithImpl<$Res>
    extends _$PaymentResponseModelCopyWithImpl<$Res, _$PaymentResponseModelImpl>
    implements _$$PaymentResponseModelImplCopyWith<$Res> {
  __$$PaymentResponseModelImplCopyWithImpl(_$PaymentResponseModelImpl _value,
      $Res Function(_$PaymentResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = freezed,
    Object? error = freezed,
    Object? success = freezed,
  }) {
    return _then(_$PaymentResponseModelImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ErrorModel?,
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as SuccessModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentResponseModelImpl implements _PaymentResponseModel {
  _$PaymentResponseModelImpl(
      {required this.status, this.code, this.error, this.success});

  factory _$PaymentResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentResponseModelImplFromJson(json);

  @override
  final String status;
  @override
  final int? code;
  @override
  final ErrorModel? error;
  @override
  final SuccessModel? success;

  @override
  String toString() {
    return 'PaymentResponseModel(status: $status, code: $code, error: $error, success: $success)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentResponseModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.success, success) || other.success == success));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, code, error, success);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentResponseModelImplCopyWith<_$PaymentResponseModelImpl>
      get copyWith =>
          __$$PaymentResponseModelImplCopyWithImpl<_$PaymentResponseModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentResponseModelImplToJson(
      this,
    );
  }
}

abstract class _PaymentResponseModel implements PaymentResponseModel {
  factory _PaymentResponseModel(
      {required final String status,
      final int? code,
      final ErrorModel? error,
      final SuccessModel? success}) = _$PaymentResponseModelImpl;

  factory _PaymentResponseModel.fromJson(Map<String, dynamic> json) =
      _$PaymentResponseModelImpl.fromJson;

  @override
  String get status;
  @override
  int? get code;
  @override
  ErrorModel? get error;
  @override
  SuccessModel? get success;
  @override
  @JsonKey(ignore: true)
  _$$PaymentResponseModelImplCopyWith<_$PaymentResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
