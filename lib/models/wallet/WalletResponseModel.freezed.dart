// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'WalletResponseModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WalletResponseModel _$WalletResponseModelFromJson(Map<String, dynamic> json) {
  return _WalletResponseModel.fromJson(json);
}

/// @nodoc
mixin _$WalletResponseModel {
  String get status => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  double? get amount => throw _privateConstructorUsedError;
  List<PackageModel>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WalletResponseModelCopyWith<WalletResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletResponseModelCopyWith<$Res> {
  factory $WalletResponseModelCopyWith(
          WalletResponseModel value, $Res Function(WalletResponseModel) then) =
      _$WalletResponseModelCopyWithImpl<$Res, WalletResponseModel>;
  @useResult
  $Res call(
      {String status,
      int code,
      String message,
      double? amount,
      List<PackageModel>? data});
}

/// @nodoc
class _$WalletResponseModelCopyWithImpl<$Res, $Val extends WalletResponseModel>
    implements $WalletResponseModelCopyWith<$Res> {
  _$WalletResponseModelCopyWithImpl(this._value, this._then);

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
    Object? amount = freezed,
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
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<PackageModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WalletResponseModelCopyWith<$Res>
    implements $WalletResponseModelCopyWith<$Res> {
  factory _$$_WalletResponseModelCopyWith(_$_WalletResponseModel value,
          $Res Function(_$_WalletResponseModel) then) =
      __$$_WalletResponseModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String status,
      int code,
      String message,
      double? amount,
      List<PackageModel>? data});
}

/// @nodoc
class __$$_WalletResponseModelCopyWithImpl<$Res>
    extends _$WalletResponseModelCopyWithImpl<$Res, _$_WalletResponseModel>
    implements _$$_WalletResponseModelCopyWith<$Res> {
  __$$_WalletResponseModelCopyWithImpl(_$_WalletResponseModel _value,
      $Res Function(_$_WalletResponseModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = null,
    Object? message = null,
    Object? amount = freezed,
    Object? data = freezed,
  }) {
    return _then(_$_WalletResponseModel(
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
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<PackageModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WalletResponseModel implements _WalletResponseModel {
  _$_WalletResponseModel(
      {required this.status,
      required this.code,
      required this.message,
      this.amount,
      final List<PackageModel>? data})
      : _data = data;

  factory _$_WalletResponseModel.fromJson(Map<String, dynamic> json) =>
      _$$_WalletResponseModelFromJson(json);

  @override
  final String status;
  @override
  final int code;
  @override
  final String message;
  @override
  final double? amount;
  final List<PackageModel>? _data;
  @override
  List<PackageModel>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'WalletResponseModel(status: $status, code: $code, message: $message, amount: $amount, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WalletResponseModel &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, code, message, amount,
      const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WalletResponseModelCopyWith<_$_WalletResponseModel> get copyWith =>
      __$$_WalletResponseModelCopyWithImpl<_$_WalletResponseModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WalletResponseModelToJson(
      this,
    );
  }
}

abstract class _WalletResponseModel implements WalletResponseModel {
  factory _WalletResponseModel(
      {required final String status,
      required final int code,
      required final String message,
      final double? amount,
      final List<PackageModel>? data}) = _$_WalletResponseModel;

  factory _WalletResponseModel.fromJson(Map<String, dynamic> json) =
      _$_WalletResponseModel.fromJson;

  @override
  String get status;
  @override
  int get code;
  @override
  String get message;
  @override
  double? get amount;
  @override
  List<PackageModel>? get data;
  @override
  @JsonKey(ignore: true)
  _$$_WalletResponseModelCopyWith<_$_WalletResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}
