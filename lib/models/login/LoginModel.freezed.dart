// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'LoginModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) {
  return _LoginModel.fromJson(json);
}

/// @nodoc
mixin _$LoginModel {
  int get code => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String? get whatsapp_url => throw _privateConstructorUsedError;
  String? get access_token => throw _privateConstructorUsedError;
  String? get refresh_token => throw _privateConstructorUsedError;
  int? get whatsapp => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginModelCopyWith<LoginModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginModelCopyWith<$Res> {
  factory $LoginModelCopyWith(
          LoginModel value, $Res Function(LoginModel) then) =
      _$LoginModelCopyWithImpl<$Res, LoginModel>;
  @useResult
  $Res call(
      {int code,
      String status,
      String message,
      String? whatsapp_url,
      String? access_token,
      String? refresh_token,
      int? whatsapp,
      String? email});
}

/// @nodoc
class _$LoginModelCopyWithImpl<$Res, $Val extends LoginModel>
    implements $LoginModelCopyWith<$Res> {
  _$LoginModelCopyWithImpl(this._value, this._then);

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
    Object? whatsapp_url = freezed,
    Object? access_token = freezed,
    Object? refresh_token = freezed,
    Object? whatsapp = freezed,
    Object? email = freezed,
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
      whatsapp_url: freezed == whatsapp_url
          ? _value.whatsapp_url
          : whatsapp_url // ignore: cast_nullable_to_non_nullable
              as String?,
      access_token: freezed == access_token
          ? _value.access_token
          : access_token // ignore: cast_nullable_to_non_nullable
              as String?,
      refresh_token: freezed == refresh_token
          ? _value.refresh_token
          : refresh_token // ignore: cast_nullable_to_non_nullable
              as String?,
      whatsapp: freezed == whatsapp
          ? _value.whatsapp
          : whatsapp // ignore: cast_nullable_to_non_nullable
              as int?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginModelImplCopyWith<$Res>
    implements $LoginModelCopyWith<$Res> {
  factory _$$LoginModelImplCopyWith(
          _$LoginModelImpl value, $Res Function(_$LoginModelImpl) then) =
      __$$LoginModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int code,
      String status,
      String message,
      String? whatsapp_url,
      String? access_token,
      String? refresh_token,
      int? whatsapp,
      String? email});
}

/// @nodoc
class __$$LoginModelImplCopyWithImpl<$Res>
    extends _$LoginModelCopyWithImpl<$Res, _$LoginModelImpl>
    implements _$$LoginModelImplCopyWith<$Res> {
  __$$LoginModelImplCopyWithImpl(
      _$LoginModelImpl _value, $Res Function(_$LoginModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? status = null,
    Object? message = null,
    Object? whatsapp_url = freezed,
    Object? access_token = freezed,
    Object? refresh_token = freezed,
    Object? whatsapp = freezed,
    Object? email = freezed,
  }) {
    return _then(_$LoginModelImpl(
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
      whatsapp_url: freezed == whatsapp_url
          ? _value.whatsapp_url
          : whatsapp_url // ignore: cast_nullable_to_non_nullable
              as String?,
      access_token: freezed == access_token
          ? _value.access_token
          : access_token // ignore: cast_nullable_to_non_nullable
              as String?,
      refresh_token: freezed == refresh_token
          ? _value.refresh_token
          : refresh_token // ignore: cast_nullable_to_non_nullable
              as String?,
      whatsapp: freezed == whatsapp
          ? _value.whatsapp
          : whatsapp // ignore: cast_nullable_to_non_nullable
              as int?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginModelImpl implements _LoginModel {
  _$LoginModelImpl(
      {required this.code,
      required this.status,
      required this.message,
      this.whatsapp_url,
      this.access_token,
      this.refresh_token,
      this.whatsapp,
      this.email});

  factory _$LoginModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginModelImplFromJson(json);

  @override
  final int code;
  @override
  final String status;
  @override
  final String message;
  @override
  final String? whatsapp_url;
  @override
  final String? access_token;
  @override
  final String? refresh_token;
  @override
  final int? whatsapp;
  @override
  final String? email;

  @override
  String toString() {
    return 'LoginModel(code: $code, status: $status, message: $message, whatsapp_url: $whatsapp_url, access_token: $access_token, refresh_token: $refresh_token, whatsapp: $whatsapp, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginModelImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.whatsapp_url, whatsapp_url) ||
                other.whatsapp_url == whatsapp_url) &&
            (identical(other.access_token, access_token) ||
                other.access_token == access_token) &&
            (identical(other.refresh_token, refresh_token) ||
                other.refresh_token == refresh_token) &&
            (identical(other.whatsapp, whatsapp) ||
                other.whatsapp == whatsapp) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code, status, message,
      whatsapp_url, access_token, refresh_token, whatsapp, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginModelImplCopyWith<_$LoginModelImpl> get copyWith =>
      __$$LoginModelImplCopyWithImpl<_$LoginModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginModelImplToJson(
      this,
    );
  }
}

abstract class _LoginModel implements LoginModel {
  factory _LoginModel(
      {required final int code,
      required final String status,
      required final String message,
      final String? whatsapp_url,
      final String? access_token,
      final String? refresh_token,
      final int? whatsapp,
      final String? email}) = _$LoginModelImpl;

  factory _LoginModel.fromJson(Map<String, dynamic> json) =
      _$LoginModelImpl.fromJson;

  @override
  int get code;
  @override
  String get status;
  @override
  String get message;
  @override
  String? get whatsapp_url;
  @override
  String? get access_token;
  @override
  String? get refresh_token;
  @override
  int? get whatsapp;
  @override
  String? get email;
  @override
  @JsonKey(ignore: true)
  _$$LoginModelImplCopyWith<_$LoginModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
