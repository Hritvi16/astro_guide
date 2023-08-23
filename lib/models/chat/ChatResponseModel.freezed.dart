// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ChatResponseModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatResponseModel _$ChatResponseModelFromJson(Map<String, dynamic> json) {
  return _ChatResponseModel.fromJson(json);
}

/// @nodoc
mixin _$ChatResponseModel {
  String get status => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  ChatModel? get data => throw _privateConstructorUsedError;
  int? get m_id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatResponseModelCopyWith<ChatResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatResponseModelCopyWith<$Res> {
  factory $ChatResponseModelCopyWith(
          ChatResponseModel value, $Res Function(ChatResponseModel) then) =
      _$ChatResponseModelCopyWithImpl<$Res, ChatResponseModel>;
  @useResult
  $Res call(
      {String status, int code, String message, ChatModel? data, int? m_id});

  $ChatModelCopyWith<$Res>? get data;
}

/// @nodoc
class _$ChatResponseModelCopyWithImpl<$Res, $Val extends ChatResponseModel>
    implements $ChatResponseModelCopyWith<$Res> {
  _$ChatResponseModelCopyWithImpl(this._value, this._then);

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
    Object? m_id = freezed,
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
              as ChatModel?,
      m_id: freezed == m_id
          ? _value.m_id
          : m_id // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ChatModelCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $ChatModelCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ChatResponseModelCopyWith<$Res>
    implements $ChatResponseModelCopyWith<$Res> {
  factory _$$_ChatResponseModelCopyWith(_$_ChatResponseModel value,
          $Res Function(_$_ChatResponseModel) then) =
      __$$_ChatResponseModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String status, int code, String message, ChatModel? data, int? m_id});

  @override
  $ChatModelCopyWith<$Res>? get data;
}

/// @nodoc
class __$$_ChatResponseModelCopyWithImpl<$Res>
    extends _$ChatResponseModelCopyWithImpl<$Res, _$_ChatResponseModel>
    implements _$$_ChatResponseModelCopyWith<$Res> {
  __$$_ChatResponseModelCopyWithImpl(
      _$_ChatResponseModel _value, $Res Function(_$_ChatResponseModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = null,
    Object? message = null,
    Object? data = freezed,
    Object? m_id = freezed,
  }) {
    return _then(_$_ChatResponseModel(
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
              as ChatModel?,
      m_id: freezed == m_id
          ? _value.m_id
          : m_id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChatResponseModel implements _ChatResponseModel {
  _$_ChatResponseModel(
      {required this.status,
      required this.code,
      required this.message,
      this.data,
      this.m_id});

  factory _$_ChatResponseModel.fromJson(Map<String, dynamic> json) =>
      _$$_ChatResponseModelFromJson(json);

  @override
  final String status;
  @override
  final int code;
  @override
  final String message;
  @override
  final ChatModel? data;
  @override
  final int? m_id;

  @override
  String toString() {
    return 'ChatResponseModel(status: $status, code: $code, message: $message, data: $data, m_id: $m_id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatResponseModel &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.m_id, m_id) || other.m_id == m_id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, status, code, message, data, m_id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatResponseModelCopyWith<_$_ChatResponseModel> get copyWith =>
      __$$_ChatResponseModelCopyWithImpl<_$_ChatResponseModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatResponseModelToJson(
      this,
    );
  }
}

abstract class _ChatResponseModel implements ChatResponseModel {
  factory _ChatResponseModel(
      {required final String status,
      required final int code,
      required final String message,
      final ChatModel? data,
      final int? m_id}) = _$_ChatResponseModel;

  factory _ChatResponseModel.fromJson(Map<String, dynamic> json) =
      _$_ChatResponseModel.fromJson;

  @override
  String get status;
  @override
  int get code;
  @override
  String get message;
  @override
  ChatModel? get data;
  @override
  int? get m_id;
  @override
  @JsonKey(ignore: true)
  _$$_ChatResponseModelCopyWith<_$_ChatResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}
