// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'CreateModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateModel _$CreateModelFromJson(Map<String, dynamic> json) {
  return _CreateModel.fromJson(json);
}

/// @nodoc
mixin _$CreateModel {
  int get code => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError;
  String? get meetingID => throw _privateConstructorUsedError;
  String? get sessionID => throw _privateConstructorUsedError;
  int? get meet_id => throw _privateConstructorUsedError;
  SessionHistoryModel? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateModelCopyWith<CreateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateModelCopyWith<$Res> {
  factory $CreateModelCopyWith(
          CreateModel value, $Res Function(CreateModel) then) =
      _$CreateModelCopyWithImpl<$Res, CreateModel>;
  @useResult
  $Res call(
      {int code,
      String status,
      String message,
      String? token,
      String? meetingID,
      String? sessionID,
      int? meet_id,
      SessionHistoryModel? data});

  $SessionHistoryModelCopyWith<$Res>? get data;
}

/// @nodoc
class _$CreateModelCopyWithImpl<$Res, $Val extends CreateModel>
    implements $CreateModelCopyWith<$Res> {
  _$CreateModelCopyWithImpl(this._value, this._then);

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
    Object? token = freezed,
    Object? meetingID = freezed,
    Object? sessionID = freezed,
    Object? meet_id = freezed,
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
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      meetingID: freezed == meetingID
          ? _value.meetingID
          : meetingID // ignore: cast_nullable_to_non_nullable
              as String?,
      sessionID: freezed == sessionID
          ? _value.sessionID
          : sessionID // ignore: cast_nullable_to_non_nullable
              as String?,
      meet_id: freezed == meet_id
          ? _value.meet_id
          : meet_id // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as SessionHistoryModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SessionHistoryModelCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $SessionHistoryModelCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CreateModelImplCopyWith<$Res>
    implements $CreateModelCopyWith<$Res> {
  factory _$$CreateModelImplCopyWith(
          _$CreateModelImpl value, $Res Function(_$CreateModelImpl) then) =
      __$$CreateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int code,
      String status,
      String message,
      String? token,
      String? meetingID,
      String? sessionID,
      int? meet_id,
      SessionHistoryModel? data});

  @override
  $SessionHistoryModelCopyWith<$Res>? get data;
}

/// @nodoc
class __$$CreateModelImplCopyWithImpl<$Res>
    extends _$CreateModelCopyWithImpl<$Res, _$CreateModelImpl>
    implements _$$CreateModelImplCopyWith<$Res> {
  __$$CreateModelImplCopyWithImpl(
      _$CreateModelImpl _value, $Res Function(_$CreateModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? status = null,
    Object? message = null,
    Object? token = freezed,
    Object? meetingID = freezed,
    Object? sessionID = freezed,
    Object? meet_id = freezed,
    Object? data = freezed,
  }) {
    return _then(_$CreateModelImpl(
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
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      meetingID: freezed == meetingID
          ? _value.meetingID
          : meetingID // ignore: cast_nullable_to_non_nullable
              as String?,
      sessionID: freezed == sessionID
          ? _value.sessionID
          : sessionID // ignore: cast_nullable_to_non_nullable
              as String?,
      meet_id: freezed == meet_id
          ? _value.meet_id
          : meet_id // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as SessionHistoryModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateModelImpl implements _CreateModel {
  _$CreateModelImpl(
      {required this.code,
      required this.status,
      required this.message,
      this.token,
      this.meetingID,
      this.sessionID,
      this.meet_id,
      this.data});

  factory _$CreateModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateModelImplFromJson(json);

  @override
  final int code;
  @override
  final String status;
  @override
  final String message;
  @override
  final String? token;
  @override
  final String? meetingID;
  @override
  final String? sessionID;
  @override
  final int? meet_id;
  @override
  final SessionHistoryModel? data;

  @override
  String toString() {
    return 'CreateModel(code: $code, status: $status, message: $message, token: $token, meetingID: $meetingID, sessionID: $sessionID, meet_id: $meet_id, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateModelImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.meetingID, meetingID) ||
                other.meetingID == meetingID) &&
            (identical(other.sessionID, sessionID) ||
                other.sessionID == sessionID) &&
            (identical(other.meet_id, meet_id) || other.meet_id == meet_id) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code, status, message, token,
      meetingID, sessionID, meet_id, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateModelImplCopyWith<_$CreateModelImpl> get copyWith =>
      __$$CreateModelImplCopyWithImpl<_$CreateModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateModelImplToJson(
      this,
    );
  }
}

abstract class _CreateModel implements CreateModel {
  factory _CreateModel(
      {required final int code,
      required final String status,
      required final String message,
      final String? token,
      final String? meetingID,
      final String? sessionID,
      final int? meet_id,
      final SessionHistoryModel? data}) = _$CreateModelImpl;

  factory _CreateModel.fromJson(Map<String, dynamic> json) =
      _$CreateModelImpl.fromJson;

  @override
  int get code;
  @override
  String get status;
  @override
  String get message;
  @override
  String? get token;
  @override
  String? get meetingID;
  @override
  String? get sessionID;
  @override
  int? get meet_id;
  @override
  SessionHistoryModel? get data;
  @override
  @JsonKey(ignore: true)
  _$$CreateModelImplCopyWith<_$CreateModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
