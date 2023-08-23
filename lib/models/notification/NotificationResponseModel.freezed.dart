// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'NotificationResponseModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotificationResponseModel _$NotificationResponseModelFromJson(
    Map<String, dynamic> json) {
  return _NotificationResponseModel.fromJson(json);
}

/// @nodoc
mixin _$NotificationResponseModel {
  String get status => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  NotificationModel get notification => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationResponseModelCopyWith<NotificationResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationResponseModelCopyWith<$Res> {
  factory $NotificationResponseModelCopyWith(NotificationResponseModel value,
          $Res Function(NotificationResponseModel) then) =
      _$NotificationResponseModelCopyWithImpl<$Res, NotificationResponseModel>;
  @useResult
  $Res call(
      {String status,
      int code,
      String message,
      NotificationModel notification});

  $NotificationModelCopyWith<$Res> get notification;
}

/// @nodoc
class _$NotificationResponseModelCopyWithImpl<$Res,
        $Val extends NotificationResponseModel>
    implements $NotificationResponseModelCopyWith<$Res> {
  _$NotificationResponseModelCopyWithImpl(this._value, this._then);

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
    Object? notification = null,
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
      notification: null == notification
          ? _value.notification
          : notification // ignore: cast_nullable_to_non_nullable
              as NotificationModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NotificationModelCopyWith<$Res> get notification {
    return $NotificationModelCopyWith<$Res>(_value.notification, (value) {
      return _then(_value.copyWith(notification: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_NotificationResponseModelCopyWith<$Res>
    implements $NotificationResponseModelCopyWith<$Res> {
  factory _$$_NotificationResponseModelCopyWith(
          _$_NotificationResponseModel value,
          $Res Function(_$_NotificationResponseModel) then) =
      __$$_NotificationResponseModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String status,
      int code,
      String message,
      NotificationModel notification});

  @override
  $NotificationModelCopyWith<$Res> get notification;
}

/// @nodoc
class __$$_NotificationResponseModelCopyWithImpl<$Res>
    extends _$NotificationResponseModelCopyWithImpl<$Res,
        _$_NotificationResponseModel>
    implements _$$_NotificationResponseModelCopyWith<$Res> {
  __$$_NotificationResponseModelCopyWithImpl(
      _$_NotificationResponseModel _value,
      $Res Function(_$_NotificationResponseModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = null,
    Object? message = null,
    Object? notification = null,
  }) {
    return _then(_$_NotificationResponseModel(
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
      notification: null == notification
          ? _value.notification
          : notification // ignore: cast_nullable_to_non_nullable
              as NotificationModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotificationResponseModel implements _NotificationResponseModel {
  _$_NotificationResponseModel(
      {required this.status,
      required this.code,
      required this.message,
      required this.notification});

  factory _$_NotificationResponseModel.fromJson(Map<String, dynamic> json) =>
      _$$_NotificationResponseModelFromJson(json);

  @override
  final String status;
  @override
  final int code;
  @override
  final String message;
  @override
  final NotificationModel notification;

  @override
  String toString() {
    return 'NotificationResponseModel(status: $status, code: $code, message: $message, notification: $notification)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotificationResponseModel &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.notification, notification) ||
                other.notification == notification));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, status, code, message, notification);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotificationResponseModelCopyWith<_$_NotificationResponseModel>
      get copyWith => __$$_NotificationResponseModelCopyWithImpl<
          _$_NotificationResponseModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotificationResponseModelToJson(
      this,
    );
  }
}

abstract class _NotificationResponseModel implements NotificationResponseModel {
  factory _NotificationResponseModel(
          {required final String status,
          required final int code,
          required final String message,
          required final NotificationModel notification}) =
      _$_NotificationResponseModel;

  factory _NotificationResponseModel.fromJson(Map<String, dynamic> json) =
      _$_NotificationResponseModel.fromJson;

  @override
  String get status;
  @override
  int get code;
  @override
  String get message;
  @override
  NotificationModel get notification;
  @override
  @JsonKey(ignore: true)
  _$$_NotificationResponseModelCopyWith<_$_NotificationResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}
