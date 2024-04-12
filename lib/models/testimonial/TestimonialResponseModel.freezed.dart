// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'TestimonialResponseModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TestimonialResponseModel _$TestimonialResponseModelFromJson(
    Map<String, dynamic> json) {
  return _TestimonialResponseModel.fromJson(json);
}

/// @nodoc
mixin _$TestimonialResponseModel {
  String get status => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  TestimonialModel? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TestimonialResponseModelCopyWith<TestimonialResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TestimonialResponseModelCopyWith<$Res> {
  factory $TestimonialResponseModelCopyWith(TestimonialResponseModel value,
          $Res Function(TestimonialResponseModel) then) =
      _$TestimonialResponseModelCopyWithImpl<$Res, TestimonialResponseModel>;
  @useResult
  $Res call({String status, int code, String message, TestimonialModel? data});

  $TestimonialModelCopyWith<$Res>? get data;
}

/// @nodoc
class _$TestimonialResponseModelCopyWithImpl<$Res,
        $Val extends TestimonialResponseModel>
    implements $TestimonialResponseModelCopyWith<$Res> {
  _$TestimonialResponseModelCopyWithImpl(this._value, this._then);

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
              as TestimonialModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TestimonialModelCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $TestimonialModelCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TestimonialResponseModelImplCopyWith<$Res>
    implements $TestimonialResponseModelCopyWith<$Res> {
  factory _$$TestimonialResponseModelImplCopyWith(
          _$TestimonialResponseModelImpl value,
          $Res Function(_$TestimonialResponseModelImpl) then) =
      __$$TestimonialResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, int code, String message, TestimonialModel? data});

  @override
  $TestimonialModelCopyWith<$Res>? get data;
}

/// @nodoc
class __$$TestimonialResponseModelImplCopyWithImpl<$Res>
    extends _$TestimonialResponseModelCopyWithImpl<$Res,
        _$TestimonialResponseModelImpl>
    implements _$$TestimonialResponseModelImplCopyWith<$Res> {
  __$$TestimonialResponseModelImplCopyWithImpl(
      _$TestimonialResponseModelImpl _value,
      $Res Function(_$TestimonialResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_$TestimonialResponseModelImpl(
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
              as TestimonialModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TestimonialResponseModelImpl implements _TestimonialResponseModel {
  _$TestimonialResponseModelImpl(
      {required this.status,
      required this.code,
      required this.message,
      this.data});

  factory _$TestimonialResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TestimonialResponseModelImplFromJson(json);

  @override
  final String status;
  @override
  final int code;
  @override
  final String message;
  @override
  final TestimonialModel? data;

  @override
  String toString() {
    return 'TestimonialResponseModel(status: $status, code: $code, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TestimonialResponseModelImpl &&
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
  _$$TestimonialResponseModelImplCopyWith<_$TestimonialResponseModelImpl>
      get copyWith => __$$TestimonialResponseModelImplCopyWithImpl<
          _$TestimonialResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TestimonialResponseModelImplToJson(
      this,
    );
  }
}

abstract class _TestimonialResponseModel implements TestimonialResponseModel {
  factory _TestimonialResponseModel(
      {required final String status,
      required final int code,
      required final String message,
      final TestimonialModel? data}) = _$TestimonialResponseModelImpl;

  factory _TestimonialResponseModel.fromJson(Map<String, dynamic> json) =
      _$TestimonialResponseModelImpl.fromJson;

  @override
  String get status;
  @override
  int get code;
  @override
  String get message;
  @override
  TestimonialModel? get data;
  @override
  @JsonKey(ignore: true)
  _$$TestimonialResponseModelImplCopyWith<_$TestimonialResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
