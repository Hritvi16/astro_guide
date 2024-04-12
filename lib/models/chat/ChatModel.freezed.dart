// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ChatModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChatModel _$ChatModelFromJson(Map<String, dynamic> json) {
  return _ChatModel.fromJson(json);
}

/// @nodoc
mixin _$ChatModel {
  int get id => throw _privateConstructorUsedError;
  int get ch_id => throw _privateConstructorUsedError;
  String get message =>
      throw _privateConstructorUsedError; // required int user_id,
// required int astro_id,
  String get sender => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get m_type => throw _privateConstructorUsedError;
  String get sent_at => throw _privateConstructorUsedError;
  String? get received_at => throw _privateConstructorUsedError;
  String? get seen_at => throw _privateConstructorUsedError;
  int? get error => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatModelCopyWith<ChatModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatModelCopyWith<$Res> {
  factory $ChatModelCopyWith(ChatModel value, $Res Function(ChatModel) then) =
      _$ChatModelCopyWithImpl<$Res, ChatModel>;
  @useResult
  $Res call(
      {int id,
      int ch_id,
      String message,
      String sender,
      String type,
      String m_type,
      String sent_at,
      String? received_at,
      String? seen_at,
      int? error});
}

/// @nodoc
class _$ChatModelCopyWithImpl<$Res, $Val extends ChatModel>
    implements $ChatModelCopyWith<$Res> {
  _$ChatModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ch_id = null,
    Object? message = null,
    Object? sender = null,
    Object? type = null,
    Object? m_type = null,
    Object? sent_at = null,
    Object? received_at = freezed,
    Object? seen_at = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      ch_id: null == ch_id
          ? _value.ch_id
          : ch_id // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      sender: null == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      m_type: null == m_type
          ? _value.m_type
          : m_type // ignore: cast_nullable_to_non_nullable
              as String,
      sent_at: null == sent_at
          ? _value.sent_at
          : sent_at // ignore: cast_nullable_to_non_nullable
              as String,
      received_at: freezed == received_at
          ? _value.received_at
          : received_at // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$ChatModelImplCopyWith<$Res>
    implements $ChatModelCopyWith<$Res> {
  factory _$$ChatModelImplCopyWith(
          _$ChatModelImpl value, $Res Function(_$ChatModelImpl) then) =
      __$$ChatModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int ch_id,
      String message,
      String sender,
      String type,
      String m_type,
      String sent_at,
      String? received_at,
      String? seen_at,
      int? error});
}

/// @nodoc
class __$$ChatModelImplCopyWithImpl<$Res>
    extends _$ChatModelCopyWithImpl<$Res, _$ChatModelImpl>
    implements _$$ChatModelImplCopyWith<$Res> {
  __$$ChatModelImplCopyWithImpl(
      _$ChatModelImpl _value, $Res Function(_$ChatModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ch_id = null,
    Object? message = null,
    Object? sender = null,
    Object? type = null,
    Object? m_type = null,
    Object? sent_at = null,
    Object? received_at = freezed,
    Object? seen_at = freezed,
    Object? error = freezed,
  }) {
    return _then(_$ChatModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      ch_id: null == ch_id
          ? _value.ch_id
          : ch_id // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      sender: null == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      m_type: null == m_type
          ? _value.m_type
          : m_type // ignore: cast_nullable_to_non_nullable
              as String,
      sent_at: null == sent_at
          ? _value.sent_at
          : sent_at // ignore: cast_nullable_to_non_nullable
              as String,
      received_at: freezed == received_at
          ? _value.received_at
          : received_at // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$ChatModelImpl implements _ChatModel {
  _$ChatModelImpl(
      {required this.id,
      required this.ch_id,
      required this.message,
      required this.sender,
      required this.type,
      required this.m_type,
      required this.sent_at,
      this.received_at,
      this.seen_at,
      this.error});

  factory _$ChatModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatModelImplFromJson(json);

  @override
  final int id;
  @override
  final int ch_id;
  @override
  final String message;
// required int user_id,
// required int astro_id,
  @override
  final String sender;
  @override
  final String type;
  @override
  final String m_type;
  @override
  final String sent_at;
  @override
  final String? received_at;
  @override
  final String? seen_at;
  @override
  final int? error;

  @override
  String toString() {
    return 'ChatModel(id: $id, ch_id: $ch_id, message: $message, sender: $sender, type: $type, m_type: $m_type, sent_at: $sent_at, received_at: $received_at, seen_at: $seen_at, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ch_id, ch_id) || other.ch_id == ch_id) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.sender, sender) || other.sender == sender) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.m_type, m_type) || other.m_type == m_type) &&
            (identical(other.sent_at, sent_at) || other.sent_at == sent_at) &&
            (identical(other.received_at, received_at) ||
                other.received_at == received_at) &&
            (identical(other.seen_at, seen_at) || other.seen_at == seen_at) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, ch_id, message, sender, type,
      m_type, sent_at, received_at, seen_at, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatModelImplCopyWith<_$ChatModelImpl> get copyWith =>
      __$$ChatModelImplCopyWithImpl<_$ChatModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatModelImplToJson(
      this,
    );
  }
}

abstract class _ChatModel implements ChatModel {
  factory _ChatModel(
      {required final int id,
      required final int ch_id,
      required final String message,
      required final String sender,
      required final String type,
      required final String m_type,
      required final String sent_at,
      final String? received_at,
      final String? seen_at,
      final int? error}) = _$ChatModelImpl;

  factory _ChatModel.fromJson(Map<String, dynamic> json) =
      _$ChatModelImpl.fromJson;

  @override
  int get id;
  @override
  int get ch_id;
  @override
  String get message;
  @override // required int user_id,
// required int astro_id,
  String get sender;
  @override
  String get type;
  @override
  String get m_type;
  @override
  String get sent_at;
  @override
  String? get received_at;
  @override
  String? get seen_at;
  @override
  int? get error;
  @override
  @JsonKey(ignore: true)
  _$$ChatModelImplCopyWith<_$ChatModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
