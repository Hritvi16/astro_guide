// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'BlogResponseModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BlogResponseModel _$BlogResponseModelFromJson(Map<String, dynamic> json) {
  return _BlogResponseModel.fromJson(json);
}

/// @nodoc
mixin _$BlogResponseModel {
  String get status => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  BlogModel? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BlogResponseModelCopyWith<BlogResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlogResponseModelCopyWith<$Res> {
  factory $BlogResponseModelCopyWith(
          BlogResponseModel value, $Res Function(BlogResponseModel) then) =
      _$BlogResponseModelCopyWithImpl<$Res, BlogResponseModel>;
  @useResult
  $Res call({String status, int code, String message, BlogModel? data});

  $BlogModelCopyWith<$Res>? get data;
}

/// @nodoc
class _$BlogResponseModelCopyWithImpl<$Res, $Val extends BlogResponseModel>
    implements $BlogResponseModelCopyWith<$Res> {
  _$BlogResponseModelCopyWithImpl(this._value, this._then);

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
              as BlogModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BlogModelCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $BlogModelCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BlogResponseModelImplCopyWith<$Res>
    implements $BlogResponseModelCopyWith<$Res> {
  factory _$$BlogResponseModelImplCopyWith(_$BlogResponseModelImpl value,
          $Res Function(_$BlogResponseModelImpl) then) =
      __$$BlogResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, int code, String message, BlogModel? data});

  @override
  $BlogModelCopyWith<$Res>? get data;
}

/// @nodoc
class __$$BlogResponseModelImplCopyWithImpl<$Res>
    extends _$BlogResponseModelCopyWithImpl<$Res, _$BlogResponseModelImpl>
    implements _$$BlogResponseModelImplCopyWith<$Res> {
  __$$BlogResponseModelImplCopyWithImpl(_$BlogResponseModelImpl _value,
      $Res Function(_$BlogResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_$BlogResponseModelImpl(
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
              as BlogModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BlogResponseModelImpl implements _BlogResponseModel {
  _$BlogResponseModelImpl(
      {required this.status,
      required this.code,
      required this.message,
      this.data});

  factory _$BlogResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BlogResponseModelImplFromJson(json);

  @override
  final String status;
  @override
  final int code;
  @override
  final String message;
  @override
  final BlogModel? data;

  @override
  String toString() {
    return 'BlogResponseModel(status: $status, code: $code, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlogResponseModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, code, message, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BlogResponseModelImplCopyWith<_$BlogResponseModelImpl> get copyWith =>
      __$$BlogResponseModelImplCopyWithImpl<_$BlogResponseModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BlogResponseModelImplToJson(
      this,
    );
  }
}

abstract class _BlogResponseModel implements BlogResponseModel {
  factory _BlogResponseModel(
      {required final String status,
      required final int code,
      required final String message,
      final BlogModel? data}) = _$BlogResponseModelImpl;

  factory _BlogResponseModel.fromJson(Map<String, dynamic> json) =
      _$BlogResponseModelImpl.fromJson;

  @override
  String get status;
  @override
  int get code;
  @override
  String get message;
  @override
  BlogModel? get data;
  @override
  @JsonKey(ignore: true)
  _$$BlogResponseModelImplCopyWith<_$BlogResponseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
