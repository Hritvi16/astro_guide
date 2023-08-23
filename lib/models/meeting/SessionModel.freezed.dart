// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'SessionModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SessionModel _$SessionModelFromJson(Map<String, dynamic> json) {
  return _SessionModel.fromJson(json);
}

/// @nodoc
mixin _$SessionModel {
  int get code => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SessionModelCopyWith<SessionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionModelCopyWith<$Res> {
  factory $SessionModelCopyWith(
          SessionModel value, $Res Function(SessionModel) then) =
      _$SessionModelCopyWithImpl<$Res, SessionModel>;
  @useResult
  $Res call({int code, String status, String message, String? data});
}

/// @nodoc
class _$SessionModelCopyWithImpl<$Res, $Val extends SessionModel>
    implements $SessionModelCopyWith<$Res> {
  _$SessionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? status = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SessionModelCopyWith<$Res>
    implements $SessionModelCopyWith<$Res> {
  factory _$$_SessionModelCopyWith(
          _$_SessionModel value, $Res Function(_$_SessionModel) then) =
      __$$_SessionModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int code, String status, String message, String? data});
}

/// @nodoc
class __$$_SessionModelCopyWithImpl<$Res>
    extends _$SessionModelCopyWithImpl<$Res, _$_SessionModel>
    implements _$$_SessionModelCopyWith<$Res> {
  __$$_SessionModelCopyWithImpl(
      _$_SessionModel _value, $Res Function(_$_SessionModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? status = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_$_SessionModel(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SessionModel implements _SessionModel {
  _$_SessionModel(
      {required this.code,
      required this.status,
      required this.message,
      this.data});

  factory _$_SessionModel.fromJson(Map<String, dynamic> json) =>
      _$$_SessionModelFromJson(json);

  @override
  final int code;
  @override
  final String status;
  @override
  final String message;
  @override
  final String? data;

  @override
  String toString() {
    return 'SessionModel(code: $code, status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SessionModel &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code, status, message, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SessionModelCopyWith<_$_SessionModel> get copyWith =>
      __$$_SessionModelCopyWithImpl<_$_SessionModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SessionModelToJson(
      this,
    );
  }
}

abstract class _SessionModel implements SessionModel {
  factory _SessionModel(
      {required final int code,
      required final String status,
      required final String message,
      final String? data}) = _$_SessionModel;

  factory _SessionModel.fromJson(Map<String, dynamic> json) =
      _$_SessionModel.fromJson;

  @override
  int get code;
  @override
  String get status;
  @override
  String get message;
  @override
  String? get data;
  @override
  @JsonKey(ignore: true)
  _$$_SessionModelCopyWith<_$_SessionModel> get copyWith =>
      throw _privateConstructorUsedError;
}
