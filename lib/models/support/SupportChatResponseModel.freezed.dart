// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'SupportChatResponseModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SupportChatResponseModel _$SupportChatResponseModelFromJson(
    Map<String, dynamic> json) {
  return _SupportChatResponseModel.fromJson(json);
}

/// @nodoc
mixin _$SupportChatResponseModel {
  String get status => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  SupportChatModel? get data => throw _privateConstructorUsedError;
  int? get m_id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SupportChatResponseModelCopyWith<SupportChatResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SupportChatResponseModelCopyWith<$Res> {
  factory $SupportChatResponseModelCopyWith(SupportChatResponseModel value,
          $Res Function(SupportChatResponseModel) then) =
      _$SupportChatResponseModelCopyWithImpl<$Res, SupportChatResponseModel>;
  @useResult
  $Res call(
      {String status,
      int code,
      String message,
      SupportChatModel? data,
      int? m_id});

  $SupportChatModelCopyWith<$Res>? get data;
}

/// @nodoc
class _$SupportChatResponseModelCopyWithImpl<$Res,
        $Val extends SupportChatResponseModel>
    implements $SupportChatResponseModelCopyWith<$Res> {
  _$SupportChatResponseModelCopyWithImpl(this._value, this._then);

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
              as SupportChatModel?,
      m_id: freezed == m_id
          ? _value.m_id
          : m_id // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SupportChatModelCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $SupportChatModelCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SupportChatResponseModelImplCopyWith<$Res>
    implements $SupportChatResponseModelCopyWith<$Res> {
  factory _$$SupportChatResponseModelImplCopyWith(
          _$SupportChatResponseModelImpl value,
          $Res Function(_$SupportChatResponseModelImpl) then) =
      __$$SupportChatResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String status,
      int code,
      String message,
      SupportChatModel? data,
      int? m_id});

  @override
  $SupportChatModelCopyWith<$Res>? get data;
}

/// @nodoc
class __$$SupportChatResponseModelImplCopyWithImpl<$Res>
    extends _$SupportChatResponseModelCopyWithImpl<$Res,
        _$SupportChatResponseModelImpl>
    implements _$$SupportChatResponseModelImplCopyWith<$Res> {
  __$$SupportChatResponseModelImplCopyWithImpl(
      _$SupportChatResponseModelImpl _value,
      $Res Function(_$SupportChatResponseModelImpl) _then)
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
    return _then(_$SupportChatResponseModelImpl(
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
              as SupportChatModel?,
      m_id: freezed == m_id
          ? _value.m_id
          : m_id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SupportChatResponseModelImpl implements _SupportChatResponseModel {
  _$SupportChatResponseModelImpl(
      {required this.status,
      required this.code,
      required this.message,
      this.data,
      this.m_id});

  factory _$SupportChatResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SupportChatResponseModelImplFromJson(json);

  @override
  final String status;
  @override
  final int code;
  @override
  final String message;
  @override
  final SupportChatModel? data;
  @override
  final int? m_id;

  @override
  String toString() {
    return 'SupportChatResponseModel(status: $status, code: $code, message: $message, data: $data, m_id: $m_id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SupportChatResponseModelImpl &&
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
  _$$SupportChatResponseModelImplCopyWith<_$SupportChatResponseModelImpl>
      get copyWith => __$$SupportChatResponseModelImplCopyWithImpl<
          _$SupportChatResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SupportChatResponseModelImplToJson(
      this,
    );
  }
}

abstract class _SupportChatResponseModel implements SupportChatResponseModel {
  factory _SupportChatResponseModel(
      {required final String status,
      required final int code,
      required final String message,
      final SupportChatModel? data,
      final int? m_id}) = _$SupportChatResponseModelImpl;

  factory _SupportChatResponseModel.fromJson(Map<String, dynamic> json) =
      _$SupportChatResponseModelImpl.fromJson;

  @override
  String get status;
  @override
  int get code;
  @override
  String get message;
  @override
  SupportChatModel? get data;
  @override
  int? get m_id;
  @override
  @JsonKey(ignore: true)
  _$$SupportChatResponseModelImplCopyWith<_$SupportChatResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
