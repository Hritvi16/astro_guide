// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'SettingResponseModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SettingResponseModel _$SettingResponseModelFromJson(Map<String, dynamic> json) {
  return _SettingResponseModel.fromJson(json);
}

/// @nodoc
mixin _$SettingResponseModel {
  String get status => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  SettingModel? get data => throw _privateConstructorUsedError;
  UserModel? get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SettingResponseModelCopyWith<SettingResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingResponseModelCopyWith<$Res> {
  factory $SettingResponseModelCopyWith(SettingResponseModel value,
          $Res Function(SettingResponseModel) then) =
      _$SettingResponseModelCopyWithImpl<$Res, SettingResponseModel>;
  @useResult
  $Res call(
      {String status,
      int code,
      String message,
      SettingModel? data,
      UserModel? user});

  $SettingModelCopyWith<$Res>? get data;
  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class _$SettingResponseModelCopyWithImpl<$Res,
        $Val extends SettingResponseModel>
    implements $SettingResponseModelCopyWith<$Res> {
  _$SettingResponseModelCopyWithImpl(this._value, this._then);

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
    Object? user = freezed,
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
              as SettingModel?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SettingModelCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $SettingModelCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SettingResponseModelCopyWith<$Res>
    implements $SettingResponseModelCopyWith<$Res> {
  factory _$$_SettingResponseModelCopyWith(_$_SettingResponseModel value,
          $Res Function(_$_SettingResponseModel) then) =
      __$$_SettingResponseModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String status,
      int code,
      String message,
      SettingModel? data,
      UserModel? user});

  @override
  $SettingModelCopyWith<$Res>? get data;
  @override
  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class __$$_SettingResponseModelCopyWithImpl<$Res>
    extends _$SettingResponseModelCopyWithImpl<$Res, _$_SettingResponseModel>
    implements _$$_SettingResponseModelCopyWith<$Res> {
  __$$_SettingResponseModelCopyWithImpl(_$_SettingResponseModel _value,
      $Res Function(_$_SettingResponseModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = null,
    Object? message = null,
    Object? data = freezed,
    Object? user = freezed,
  }) {
    return _then(_$_SettingResponseModel(
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
              as SettingModel?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SettingResponseModel implements _SettingResponseModel {
  _$_SettingResponseModel(
      {required this.status,
      required this.code,
      required this.message,
      this.data,
      this.user});

  factory _$_SettingResponseModel.fromJson(Map<String, dynamic> json) =>
      _$$_SettingResponseModelFromJson(json);

  @override
  final String status;
  @override
  final int code;
  @override
  final String message;
  @override
  final SettingModel? data;
  @override
  final UserModel? user;

  @override
  String toString() {
    return 'SettingResponseModel(status: $status, code: $code, message: $message, data: $data, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SettingResponseModel &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, status, code, message, data, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SettingResponseModelCopyWith<_$_SettingResponseModel> get copyWith =>
      __$$_SettingResponseModelCopyWithImpl<_$_SettingResponseModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SettingResponseModelToJson(
      this,
    );
  }
}

abstract class _SettingResponseModel implements SettingResponseModel {
  factory _SettingResponseModel(
      {required final String status,
      required final int code,
      required final String message,
      final SettingModel? data,
      final UserModel? user}) = _$_SettingResponseModel;

  factory _SettingResponseModel.fromJson(Map<String, dynamic> json) =
      _$_SettingResponseModel.fromJson;

  @override
  String get status;
  @override
  int get code;
  @override
  String get message;
  @override
  SettingModel? get data;
  @override
  UserModel? get user;
  @override
  @JsonKey(ignore: true)
  _$$_SettingResponseModelCopyWith<_$_SettingResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}
