// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'SupportChatModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SupportChatModel _$SupportChatModelFromJson(Map<String, dynamic> json) {
  return _SupportChatModel.fromJson(json);
}

/// @nodoc
mixin _$SupportChatModel {
  int get id => throw _privateConstructorUsedError;
  int get sup_id => throw _privateConstructorUsedError;
  String get sender => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String get sent_at => throw _privateConstructorUsedError;
  String? get seen_at => throw _privateConstructorUsedError;
  int? get error => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SupportChatModelCopyWith<SupportChatModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SupportChatModelCopyWith<$Res> {
  factory $SupportChatModelCopyWith(
          SupportChatModel value, $Res Function(SupportChatModel) then) =
      _$SupportChatModelCopyWithImpl<$Res, SupportChatModel>;
  @useResult
  $Res call(
      {int id,
      int sup_id,
      String sender,
      String message,
      String sent_at,
      String? seen_at,
      int? error});
}

/// @nodoc
class _$SupportChatModelCopyWithImpl<$Res, $Val extends SupportChatModel>
    implements $SupportChatModelCopyWith<$Res> {
  _$SupportChatModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sup_id = null,
    Object? sender = null,
    Object? message = null,
    Object? sent_at = null,
    Object? seen_at = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      sup_id: null == sup_id
          ? _value.sup_id
          : sup_id // ignore: cast_nullable_to_non_nullable
              as int,
      sender: null == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      sent_at: null == sent_at
          ? _value.sent_at
          : sent_at // ignore: cast_nullable_to_non_nullable
              as String,
      seen_at: freezed == seen_at
          ? _value.seen_at
          : seen_at // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SupportChatModelCopyWith<$Res>
    implements $SupportChatModelCopyWith<$Res> {
  factory _$$_SupportChatModelCopyWith(
          _$_SupportChatModel value, $Res Function(_$_SupportChatModel) then) =
      __$$_SupportChatModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int sup_id,
      String sender,
      String message,
      String sent_at,
      String? seen_at,
      int? error});
}

/// @nodoc
class __$$_SupportChatModelCopyWithImpl<$Res>
    extends _$SupportChatModelCopyWithImpl<$Res, _$_SupportChatModel>
    implements _$$_SupportChatModelCopyWith<$Res> {
  __$$_SupportChatModelCopyWithImpl(
      _$_SupportChatModel _value, $Res Function(_$_SupportChatModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sup_id = null,
    Object? sender = null,
    Object? message = null,
    Object? sent_at = null,
    Object? seen_at = freezed,
    Object? error = freezed,
  }) {
    return _then(_$_SupportChatModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      sup_id: null == sup_id
          ? _value.sup_id
          : sup_id // ignore: cast_nullable_to_non_nullable
              as int,
      sender: null == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      sent_at: null == sent_at
          ? _value.sent_at
          : sent_at // ignore: cast_nullable_to_non_nullable
              as String,
      seen_at: freezed == seen_at
          ? _value.seen_at
          : seen_at // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SupportChatModel implements _SupportChatModel {
  _$_SupportChatModel(
      {required this.id,
      required this.sup_id,
      required this.sender,
      required this.message,
      required this.sent_at,
      this.seen_at,
      this.error});

  factory _$_SupportChatModel.fromJson(Map<String, dynamic> json) =>
      _$$_SupportChatModelFromJson(json);

  @override
  final int id;
  @override
  final int sup_id;
  @override
  final String sender;
  @override
  final String message;
  @override
  final String sent_at;
  @override
  final String? seen_at;
  @override
  final int? error;

  @override
  String toString() {
    return 'SupportChatModel(id: $id, sup_id: $sup_id, sender: $sender, message: $message, sent_at: $sent_at, seen_at: $seen_at, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SupportChatModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sup_id, sup_id) || other.sup_id == sup_id) &&
            (identical(other.sender, sender) || other.sender == sender) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.sent_at, sent_at) || other.sent_at == sent_at) &&
            (identical(other.seen_at, seen_at) || other.seen_at == seen_at) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, sup_id, sender, message, sent_at, seen_at, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SupportChatModelCopyWith<_$_SupportChatModel> get copyWith =>
      __$$_SupportChatModelCopyWithImpl<_$_SupportChatModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SupportChatModelToJson(
      this,
    );
  }
}

abstract class _SupportChatModel implements SupportChatModel {
  factory _SupportChatModel(
      {required final int id,
      required final int sup_id,
      required final String sender,
      required final String message,
      required final String sent_at,
      final String? seen_at,
      final int? error}) = _$_SupportChatModel;

  factory _SupportChatModel.fromJson(Map<String, dynamic> json) =
      _$_SupportChatModel.fromJson;

  @override
  int get id;
  @override
  int get sup_id;
  @override
  String get sender;
  @override
  String get message;
  @override
  String get sent_at;
  @override
  String? get seen_at;
  @override
  int? get error;
  @override
  @JsonKey(ignore: true)
  _$$_SupportChatModelCopyWith<_$_SupportChatModel> get copyWith =>
      throw _privateConstructorUsedError;
}
