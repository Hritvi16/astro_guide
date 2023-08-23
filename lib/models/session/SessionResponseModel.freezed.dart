// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'SessionResponseModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SessionResponseModel _$SessionResponseModelFromJson(Map<String, dynamic> json) {
  return _SessionResponseModel.fromJson(json);
}

/// @nodoc
mixin _$SessionResponseModel {
  String get status => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  AstrologerModel? get astrologer => throw _privateConstructorUsedError;
  SessionHistoryModel? get session_history =>
      throw _privateConstructorUsedError;
  double? get wallet => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SessionResponseModelCopyWith<SessionResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionResponseModelCopyWith<$Res> {
  factory $SessionResponseModelCopyWith(SessionResponseModel value,
          $Res Function(SessionResponseModel) then) =
      _$SessionResponseModelCopyWithImpl<$Res, SessionResponseModel>;
  @useResult
  $Res call(
      {String status,
      int code,
      String message,
      AstrologerModel? astrologer,
      SessionHistoryModel? session_history,
      double? wallet});

  $AstrologerModelCopyWith<$Res>? get astrologer;
  $SessionHistoryModelCopyWith<$Res>? get session_history;
}

/// @nodoc
class _$SessionResponseModelCopyWithImpl<$Res,
        $Val extends SessionResponseModel>
    implements $SessionResponseModelCopyWith<$Res> {
  _$SessionResponseModelCopyWithImpl(this._value, this._then);

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
    Object? astrologer = freezed,
    Object? session_history = freezed,
    Object? wallet = freezed,
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
      astrologer: freezed == astrologer
          ? _value.astrologer
          : astrologer // ignore: cast_nullable_to_non_nullable
              as AstrologerModel?,
      session_history: freezed == session_history
          ? _value.session_history
          : session_history // ignore: cast_nullable_to_non_nullable
              as SessionHistoryModel?,
      wallet: freezed == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AstrologerModelCopyWith<$Res>? get astrologer {
    if (_value.astrologer == null) {
      return null;
    }

    return $AstrologerModelCopyWith<$Res>(_value.astrologer!, (value) {
      return _then(_value.copyWith(astrologer: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SessionHistoryModelCopyWith<$Res>? get session_history {
    if (_value.session_history == null) {
      return null;
    }

    return $SessionHistoryModelCopyWith<$Res>(_value.session_history!, (value) {
      return _then(_value.copyWith(session_history: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SessionResponseModelCopyWith<$Res>
    implements $SessionResponseModelCopyWith<$Res> {
  factory _$$_SessionResponseModelCopyWith(_$_SessionResponseModel value,
          $Res Function(_$_SessionResponseModel) then) =
      __$$_SessionResponseModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String status,
      int code,
      String message,
      AstrologerModel? astrologer,
      SessionHistoryModel? session_history,
      double? wallet});

  @override
  $AstrologerModelCopyWith<$Res>? get astrologer;
  @override
  $SessionHistoryModelCopyWith<$Res>? get session_history;
}

/// @nodoc
class __$$_SessionResponseModelCopyWithImpl<$Res>
    extends _$SessionResponseModelCopyWithImpl<$Res, _$_SessionResponseModel>
    implements _$$_SessionResponseModelCopyWith<$Res> {
  __$$_SessionResponseModelCopyWithImpl(_$_SessionResponseModel _value,
      $Res Function(_$_SessionResponseModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = null,
    Object? message = null,
    Object? astrologer = freezed,
    Object? session_history = freezed,
    Object? wallet = freezed,
  }) {
    return _then(_$_SessionResponseModel(
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
      astrologer: freezed == astrologer
          ? _value.astrologer
          : astrologer // ignore: cast_nullable_to_non_nullable
              as AstrologerModel?,
      session_history: freezed == session_history
          ? _value.session_history
          : session_history // ignore: cast_nullable_to_non_nullable
              as SessionHistoryModel?,
      wallet: freezed == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SessionResponseModel implements _SessionResponseModel {
  _$_SessionResponseModel(
      {required this.status,
      required this.code,
      required this.message,
      this.astrologer,
      this.session_history,
      this.wallet});

  factory _$_SessionResponseModel.fromJson(Map<String, dynamic> json) =>
      _$$_SessionResponseModelFromJson(json);

  @override
  final String status;
  @override
  final int code;
  @override
  final String message;
  @override
  final AstrologerModel? astrologer;
  @override
  final SessionHistoryModel? session_history;
  @override
  final double? wallet;

  @override
  String toString() {
    return 'SessionResponseModel(status: $status, code: $code, message: $message, astrologer: $astrologer, session_history: $session_history, wallet: $wallet)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SessionResponseModel &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.astrologer, astrologer) ||
                other.astrologer == astrologer) &&
            (identical(other.session_history, session_history) ||
                other.session_history == session_history) &&
            (identical(other.wallet, wallet) || other.wallet == wallet));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, code, message, astrologer, session_history, wallet);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SessionResponseModelCopyWith<_$_SessionResponseModel> get copyWith =>
      __$$_SessionResponseModelCopyWithImpl<_$_SessionResponseModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SessionResponseModelToJson(
      this,
    );
  }
}

abstract class _SessionResponseModel implements SessionResponseModel {
  factory _SessionResponseModel(
      {required final String status,
      required final int code,
      required final String message,
      final AstrologerModel? astrologer,
      final SessionHistoryModel? session_history,
      final double? wallet}) = _$_SessionResponseModel;

  factory _SessionResponseModel.fromJson(Map<String, dynamic> json) =
      _$_SessionResponseModel.fromJson;

  @override
  String get status;
  @override
  int get code;
  @override
  String get message;
  @override
  AstrologerModel? get astrologer;
  @override
  SessionHistoryModel? get session_history;
  @override
  double? get wallet;
  @override
  @JsonKey(ignore: true)
  _$$_SessionResponseModelCopyWith<_$_SessionResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}
