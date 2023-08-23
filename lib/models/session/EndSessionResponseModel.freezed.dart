// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'EndSessionResponseModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EndSessionResponseModel _$EndSessionResponseModelFromJson(
    Map<String, dynamic> json) {
  return _EndSessionResponseModel.fromJson(json);
}

/// @nodoc
mixin _$EndSessionResponseModel {
  String get status => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  int? get seconds => throw _privateConstructorUsedError;
  double? get amount => throw _privateConstructorUsedError;
  double? get wallet => throw _privateConstructorUsedError;
  String? get chat_type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EndSessionResponseModelCopyWith<EndSessionResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EndSessionResponseModelCopyWith<$Res> {
  factory $EndSessionResponseModelCopyWith(EndSessionResponseModel value,
          $Res Function(EndSessionResponseModel) then) =
      _$EndSessionResponseModelCopyWithImpl<$Res, EndSessionResponseModel>;
  @useResult
  $Res call(
      {String status,
      int code,
      String message,
      int? seconds,
      double? amount,
      double? wallet,
      String? chat_type});
}

/// @nodoc
class _$EndSessionResponseModelCopyWithImpl<$Res,
        $Val extends EndSessionResponseModel>
    implements $EndSessionResponseModelCopyWith<$Res> {
  _$EndSessionResponseModelCopyWithImpl(this._value, this._then);

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
    Object? seconds = freezed,
    Object? amount = freezed,
    Object? wallet = freezed,
    Object? chat_type = freezed,
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
      seconds: freezed == seconds
          ? _value.seconds
          : seconds // ignore: cast_nullable_to_non_nullable
              as int?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      wallet: freezed == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as double?,
      chat_type: freezed == chat_type
          ? _value.chat_type
          : chat_type // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EndSessionResponseModelCopyWith<$Res>
    implements $EndSessionResponseModelCopyWith<$Res> {
  factory _$$_EndSessionResponseModelCopyWith(_$_EndSessionResponseModel value,
          $Res Function(_$_EndSessionResponseModel) then) =
      __$$_EndSessionResponseModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String status,
      int code,
      String message,
      int? seconds,
      double? amount,
      double? wallet,
      String? chat_type});
}

/// @nodoc
class __$$_EndSessionResponseModelCopyWithImpl<$Res>
    extends _$EndSessionResponseModelCopyWithImpl<$Res,
        _$_EndSessionResponseModel>
    implements _$$_EndSessionResponseModelCopyWith<$Res> {
  __$$_EndSessionResponseModelCopyWithImpl(_$_EndSessionResponseModel _value,
      $Res Function(_$_EndSessionResponseModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = null,
    Object? message = null,
    Object? seconds = freezed,
    Object? amount = freezed,
    Object? wallet = freezed,
    Object? chat_type = freezed,
  }) {
    return _then(_$_EndSessionResponseModel(
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
      seconds: freezed == seconds
          ? _value.seconds
          : seconds // ignore: cast_nullable_to_non_nullable
              as int?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      wallet: freezed == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as double?,
      chat_type: freezed == chat_type
          ? _value.chat_type
          : chat_type // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EndSessionResponseModel implements _EndSessionResponseModel {
  _$_EndSessionResponseModel(
      {required this.status,
      required this.code,
      required this.message,
      this.seconds,
      this.amount,
      this.wallet,
      this.chat_type});

  factory _$_EndSessionResponseModel.fromJson(Map<String, dynamic> json) =>
      _$$_EndSessionResponseModelFromJson(json);

  @override
  final String status;
  @override
  final int code;
  @override
  final String message;
  @override
  final int? seconds;
  @override
  final double? amount;
  @override
  final double? wallet;
  @override
  final String? chat_type;

  @override
  String toString() {
    return 'EndSessionResponseModel(status: $status, code: $code, message: $message, seconds: $seconds, amount: $amount, wallet: $wallet, chat_type: $chat_type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EndSessionResponseModel &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.seconds, seconds) || other.seconds == seconds) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.wallet, wallet) || other.wallet == wallet) &&
            (identical(other.chat_type, chat_type) ||
                other.chat_type == chat_type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, code, message, seconds, amount, wallet, chat_type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EndSessionResponseModelCopyWith<_$_EndSessionResponseModel>
      get copyWith =>
          __$$_EndSessionResponseModelCopyWithImpl<_$_EndSessionResponseModel>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EndSessionResponseModelToJson(
      this,
    );
  }
}

abstract class _EndSessionResponseModel implements EndSessionResponseModel {
  factory _EndSessionResponseModel(
      {required final String status,
      required final int code,
      required final String message,
      final int? seconds,
      final double? amount,
      final double? wallet,
      final String? chat_type}) = _$_EndSessionResponseModel;

  factory _EndSessionResponseModel.fromJson(Map<String, dynamic> json) =
      _$_EndSessionResponseModel.fromJson;

  @override
  String get status;
  @override
  int get code;
  @override
  String get message;
  @override
  int? get seconds;
  @override
  double? get amount;
  @override
  double? get wallet;
  @override
  String? get chat_type;
  @override
  @JsonKey(ignore: true)
  _$$_EndSessionResponseModelCopyWith<_$_EndSessionResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}
