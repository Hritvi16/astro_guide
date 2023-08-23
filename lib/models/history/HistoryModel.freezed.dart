// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'HistoryModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HistoryModel _$HistoryModelFromJson(Map<String, dynamic> json) {
  return _HistoryModel.fromJson(json);
}

/// @nodoc
mixin _$HistoryModel {
  String get status => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  double? get amount => throw _privateConstructorUsedError;
  List<WalletHistoryModel>? get wallet => throw _privateConstructorUsedError;
  List<WalletHistoryModel>? get payment => throw _privateConstructorUsedError;
  List<SessionHistoryModel>? get call => throw _privateConstructorUsedError;
  List<SessionHistoryModel>? get chat => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HistoryModelCopyWith<HistoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryModelCopyWith<$Res> {
  factory $HistoryModelCopyWith(
          HistoryModel value, $Res Function(HistoryModel) then) =
      _$HistoryModelCopyWithImpl<$Res, HistoryModel>;
  @useResult
  $Res call(
      {String status,
      int code,
      String message,
      double? amount,
      List<WalletHistoryModel>? wallet,
      List<WalletHistoryModel>? payment,
      List<SessionHistoryModel>? call,
      List<SessionHistoryModel>? chat});
}

/// @nodoc
class _$HistoryModelCopyWithImpl<$Res, $Val extends HistoryModel>
    implements $HistoryModelCopyWith<$Res> {
  _$HistoryModelCopyWithImpl(this._value, this._then);

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
    Object? wallet = freezed,
    Object? payment = freezed,
    Object? call = freezed,
    Object? chat = freezed,
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
      wallet: freezed == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as List<WalletHistoryModel>?,
      payment: freezed == payment
          ? _value.payment
          : payment // ignore: cast_nullable_to_non_nullable
              as List<WalletHistoryModel>?,
      call: freezed == call
          ? _value.call
          : call // ignore: cast_nullable_to_non_nullable
              as List<SessionHistoryModel>?,
      chat: freezed == chat
          ? _value.chat
          : chat // ignore: cast_nullable_to_non_nullable
              as List<SessionHistoryModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HistoryModelCopyWith<$Res>
    implements $HistoryModelCopyWith<$Res> {
  factory _$$_HistoryModelCopyWith(
          _$_HistoryModel value, $Res Function(_$_HistoryModel) then) =
      __$$_HistoryModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String status,
      int code,
      String message,
      double? amount,
      List<WalletHistoryModel>? wallet,
      List<WalletHistoryModel>? payment,
      List<SessionHistoryModel>? call,
      List<SessionHistoryModel>? chat});
}

/// @nodoc
class __$$_HistoryModelCopyWithImpl<$Res>
    extends _$HistoryModelCopyWithImpl<$Res, _$_HistoryModel>
    implements _$$_HistoryModelCopyWith<$Res> {
  __$$_HistoryModelCopyWithImpl(
      _$_HistoryModel _value, $Res Function(_$_HistoryModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = null,
    Object? message = null,
    Object? amount = freezed,
    Object? wallet = freezed,
    Object? payment = freezed,
    Object? call = freezed,
    Object? chat = freezed,
  }) {
    return _then(_$_HistoryModel(
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
      wallet: freezed == wallet
          ? _value._wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as List<WalletHistoryModel>?,
      payment: freezed == payment
          ? _value._payment
          : payment // ignore: cast_nullable_to_non_nullable
              as List<WalletHistoryModel>?,
      call: freezed == call
          ? _value._call
          : call // ignore: cast_nullable_to_non_nullable
              as List<SessionHistoryModel>?,
      chat: freezed == chat
          ? _value._chat
          : chat // ignore: cast_nullable_to_non_nullable
              as List<SessionHistoryModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HistoryModel implements _HistoryModel {
  _$_HistoryModel(
      {required this.status,
      required this.code,
      required this.message,
      this.amount,
      final List<WalletHistoryModel>? wallet,
      final List<WalletHistoryModel>? payment,
      final List<SessionHistoryModel>? call,
      final List<SessionHistoryModel>? chat})
      : _wallet = wallet,
        _payment = payment,
        _call = call,
        _chat = chat;

  factory _$_HistoryModel.fromJson(Map<String, dynamic> json) =>
      _$$_HistoryModelFromJson(json);

  @override
  final String status;
  @override
  final int code;
  @override
  final String message;
  @override
  final double? amount;
  final List<WalletHistoryModel>? _wallet;
  @override
  List<WalletHistoryModel>? get wallet {
    final value = _wallet;
    if (value == null) return null;
    if (_wallet is EqualUnmodifiableListView) return _wallet;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<WalletHistoryModel>? _payment;
  @override
  List<WalletHistoryModel>? get payment {
    final value = _payment;
    if (value == null) return null;
    if (_payment is EqualUnmodifiableListView) return _payment;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<SessionHistoryModel>? _call;
  @override
  List<SessionHistoryModel>? get call {
    final value = _call;
    if (value == null) return null;
    if (_call is EqualUnmodifiableListView) return _call;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<SessionHistoryModel>? _chat;
  @override
  List<SessionHistoryModel>? get chat {
    final value = _chat;
    if (value == null) return null;
    if (_chat is EqualUnmodifiableListView) return _chat;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'HistoryModel(status: $status, code: $code, message: $message, amount: $amount, wallet: $wallet, payment: $payment, call: $call, chat: $chat)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HistoryModel &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            const DeepCollectionEquality().equals(other._wallet, _wallet) &&
            const DeepCollectionEquality().equals(other._payment, _payment) &&
            const DeepCollectionEquality().equals(other._call, _call) &&
            const DeepCollectionEquality().equals(other._chat, _chat));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      code,
      message,
      amount,
      const DeepCollectionEquality().hash(_wallet),
      const DeepCollectionEquality().hash(_payment),
      const DeepCollectionEquality().hash(_call),
      const DeepCollectionEquality().hash(_chat));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HistoryModelCopyWith<_$_HistoryModel> get copyWith =>
      __$$_HistoryModelCopyWithImpl<_$_HistoryModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HistoryModelToJson(
      this,
    );
  }
}

abstract class _HistoryModel implements HistoryModel {
  factory _HistoryModel(
      {required final String status,
      required final int code,
      required final String message,
      final double? amount,
      final List<WalletHistoryModel>? wallet,
      final List<WalletHistoryModel>? payment,
      final List<SessionHistoryModel>? call,
      final List<SessionHistoryModel>? chat}) = _$_HistoryModel;

  factory _HistoryModel.fromJson(Map<String, dynamic> json) =
      _$_HistoryModel.fromJson;

  @override
  String get status;
  @override
  int get code;
  @override
  String get message;
  @override
  double? get amount;
  @override
  List<WalletHistoryModel>? get wallet;
  @override
  List<WalletHistoryModel>? get payment;
  @override
  List<SessionHistoryModel>? get call;
  @override
  List<SessionHistoryModel>? get chat;
  @override
  @JsonKey(ignore: true)
  _$$_HistoryModelCopyWith<_$_HistoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}
