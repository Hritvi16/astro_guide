// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'NotificationListModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NotificationListModel _$NotificationListModelFromJson(
    Map<String, dynamic> json) {
  return _NotificationListModel.fromJson(json);
}

/// @nodoc
mixin _$NotificationListModel {
  String get status => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<NotificationModel>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationListModelCopyWith<NotificationListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationListModelCopyWith<$Res> {
  factory $NotificationListModelCopyWith(NotificationListModel value,
          $Res Function(NotificationListModel) then) =
      _$NotificationListModelCopyWithImpl<$Res, NotificationListModel>;
  @useResult
  $Res call(
      {String status, int code, String message, List<NotificationModel>? data});
}

/// @nodoc
class _$NotificationListModelCopyWithImpl<$Res,
        $Val extends NotificationListModel>
    implements $NotificationListModelCopyWith<$Res> {
  _$NotificationListModelCopyWithImpl(this._value, this._then);

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
              as List<NotificationModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationListModelImplCopyWith<$Res>
    implements $NotificationListModelCopyWith<$Res> {
  factory _$$NotificationListModelImplCopyWith(
          _$NotificationListModelImpl value,
          $Res Function(_$NotificationListModelImpl) then) =
      __$$NotificationListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String status, int code, String message, List<NotificationModel>? data});
}

/// @nodoc
class __$$NotificationListModelImplCopyWithImpl<$Res>
    extends _$NotificationListModelCopyWithImpl<$Res,
        _$NotificationListModelImpl>
    implements _$$NotificationListModelImplCopyWith<$Res> {
  __$$NotificationListModelImplCopyWithImpl(_$NotificationListModelImpl _value,
      $Res Function(_$NotificationListModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_$NotificationListModelImpl(
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
              as List<NotificationModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationListModelImpl implements _NotificationListModel {
  _$NotificationListModelImpl(
      {required this.status,
      required this.code,
      required this.message,
      final List<NotificationModel>? data})
      : _data = data;

  factory _$NotificationListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationListModelImplFromJson(json);

  @override
  final String status;
  @override
  final int code;
  @override
  final String message;
  final List<NotificationModel>? _data;
  @override
  List<NotificationModel>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'NotificationListModel(status: $status, code: $code, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationListModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, code, message,
      const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationListModelImplCopyWith<_$NotificationListModelImpl>
      get copyWith => __$$NotificationListModelImplCopyWithImpl<
          _$NotificationListModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationListModelImplToJson(
      this,
    );
  }
}

abstract class _NotificationListModel implements NotificationListModel {
  factory _NotificationListModel(
      {required final String status,
      required final int code,
      required final String message,
      final List<NotificationModel>? data}) = _$NotificationListModelImpl;

  factory _NotificationListModel.fromJson(Map<String, dynamic> json) =
      _$NotificationListModelImpl.fromJson;

  @override
  String get status;
  @override
  int get code;
  @override
  String get message;
  @override
  List<NotificationModel>? get data;
  @override
  @JsonKey(ignore: true)
  _$$NotificationListModelImplCopyWith<_$NotificationListModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
