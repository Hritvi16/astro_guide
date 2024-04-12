// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'SessionListModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SessionListModel _$SessionListModelFromJson(Map<String, dynamic> json) {
  return _SessionListModel.fromJson(json);
}

/// @nodoc
mixin _$SessionListModel {
  String get status => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<ChatModel>? get data => throw _privateConstructorUsedError;
  AstrologerModel? get astrologer => throw _privateConstructorUsedError;
  SessionHistoryModel? get session_history =>
      throw _privateConstructorUsedError;
  double? get wallet => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SessionListModelCopyWith<SessionListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionListModelCopyWith<$Res> {
  factory $SessionListModelCopyWith(
          SessionListModel value, $Res Function(SessionListModel) then) =
      _$SessionListModelCopyWithImpl<$Res, SessionListModel>;
  @useResult
  $Res call(
      {String status,
      int code,
      String message,
      List<ChatModel>? data,
      AstrologerModel? astrologer,
      SessionHistoryModel? session_history,
      double? wallet});

  $AstrologerModelCopyWith<$Res>? get astrologer;
  $SessionHistoryModelCopyWith<$Res>? get session_history;
}

/// @nodoc
class _$SessionListModelCopyWithImpl<$Res, $Val extends SessionListModel>
    implements $SessionListModelCopyWith<$Res> {
  _$SessionListModelCopyWithImpl(this._value, this._then);

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
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ChatModel>?,
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
abstract class _$$SessionListModelImplCopyWith<$Res>
    implements $SessionListModelCopyWith<$Res> {
  factory _$$SessionListModelImplCopyWith(_$SessionListModelImpl value,
          $Res Function(_$SessionListModelImpl) then) =
      __$$SessionListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String status,
      int code,
      String message,
      List<ChatModel>? data,
      AstrologerModel? astrologer,
      SessionHistoryModel? session_history,
      double? wallet});

  @override
  $AstrologerModelCopyWith<$Res>? get astrologer;
  @override
  $SessionHistoryModelCopyWith<$Res>? get session_history;
}

/// @nodoc
class __$$SessionListModelImplCopyWithImpl<$Res>
    extends _$SessionListModelCopyWithImpl<$Res, _$SessionListModelImpl>
    implements _$$SessionListModelImplCopyWith<$Res> {
  __$$SessionListModelImplCopyWithImpl(_$SessionListModelImpl _value,
      $Res Function(_$SessionListModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = null,
    Object? message = null,
    Object? data = freezed,
    Object? astrologer = freezed,
    Object? session_history = freezed,
    Object? wallet = freezed,
  }) {
    return _then(_$SessionListModelImpl(
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
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ChatModel>?,
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
class _$SessionListModelImpl implements _SessionListModel {
  _$SessionListModelImpl(
      {required this.status,
      required this.code,
      required this.message,
      final List<ChatModel>? data,
      this.astrologer,
      this.session_history,
      this.wallet})
      : _data = data;

  factory _$SessionListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SessionListModelImplFromJson(json);

  @override
  final String status;
  @override
  final int code;
  @override
  final String message;
  final List<ChatModel>? _data;
  @override
  List<ChatModel>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final AstrologerModel? astrologer;
  @override
  final SessionHistoryModel? session_history;
  @override
  final double? wallet;

  @override
  String toString() {
    return 'SessionListModel(status: $status, code: $code, message: $message, data: $data, astrologer: $astrologer, session_history: $session_history, wallet: $wallet)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionListModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.astrologer, astrologer) ||
                other.astrologer == astrologer) &&
            (identical(other.session_history, session_history) ||
                other.session_history == session_history) &&
            (identical(other.wallet, wallet) || other.wallet == wallet));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      code,
      message,
      const DeepCollectionEquality().hash(_data),
      astrologer,
      session_history,
      wallet);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionListModelImplCopyWith<_$SessionListModelImpl> get copyWith =>
      __$$SessionListModelImplCopyWithImpl<_$SessionListModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SessionListModelImplToJson(
      this,
    );
  }
}

abstract class _SessionListModel implements SessionListModel {
  factory _SessionListModel(
      {required final String status,
      required final int code,
      required final String message,
      final List<ChatModel>? data,
      final AstrologerModel? astrologer,
      final SessionHistoryModel? session_history,
      final double? wallet}) = _$SessionListModelImpl;

  factory _SessionListModel.fromJson(Map<String, dynamic> json) =
      _$SessionListModelImpl.fromJson;

  @override
  String get status;
  @override
  int get code;
  @override
  String get message;
  @override
  List<ChatModel>? get data;
  @override
  AstrologerModel? get astrologer;
  @override
  SessionHistoryModel? get session_history;
  @override
  double? get wallet;
  @override
  @JsonKey(ignore: true)
  _$$SessionListModelImplCopyWith<_$SessionListModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
