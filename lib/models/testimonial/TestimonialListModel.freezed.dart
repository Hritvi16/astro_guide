// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'TestimonialListModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TestimonialListModel _$TestimonialListModelFromJson(Map<String, dynamic> json) {
  return _TestimonialListModel.fromJson(json);
}

/// @nodoc
mixin _$TestimonialListModel {
  String get status => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<TestimonialModel>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TestimonialListModelCopyWith<TestimonialListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TestimonialListModelCopyWith<$Res> {
  factory $TestimonialListModelCopyWith(TestimonialListModel value,
          $Res Function(TestimonialListModel) then) =
      _$TestimonialListModelCopyWithImpl<$Res, TestimonialListModel>;
  @useResult
  $Res call(
      {String status, int code, String message, List<TestimonialModel>? data});
}

/// @nodoc
class _$TestimonialListModelCopyWithImpl<$Res,
        $Val extends TestimonialListModel>
    implements $TestimonialListModelCopyWith<$Res> {
  _$TestimonialListModelCopyWithImpl(this._value, this._then);

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
              as List<TestimonialModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TestimonialListModelCopyWith<$Res>
    implements $TestimonialListModelCopyWith<$Res> {
  factory _$$_TestimonialListModelCopyWith(_$_TestimonialListModel value,
          $Res Function(_$_TestimonialListModel) then) =
      __$$_TestimonialListModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String status, int code, String message, List<TestimonialModel>? data});
}

/// @nodoc
class __$$_TestimonialListModelCopyWithImpl<$Res>
    extends _$TestimonialListModelCopyWithImpl<$Res, _$_TestimonialListModel>
    implements _$$_TestimonialListModelCopyWith<$Res> {
  __$$_TestimonialListModelCopyWithImpl(_$_TestimonialListModel _value,
      $Res Function(_$_TestimonialListModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_$_TestimonialListModel(
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
              as List<TestimonialModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TestimonialListModel implements _TestimonialListModel {
  _$_TestimonialListModel(
      {required this.status,
      required this.code,
      required this.message,
      final List<TestimonialModel>? data})
      : _data = data;

  factory _$_TestimonialListModel.fromJson(Map<String, dynamic> json) =>
      _$$_TestimonialListModelFromJson(json);

  @override
  final String status;
  @override
  final int code;
  @override
  final String message;
  final List<TestimonialModel>? _data;
  @override
  List<TestimonialModel>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'TestimonialListModel(status: $status, code: $code, message: $message, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TestimonialListModel &&
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
  _$$_TestimonialListModelCopyWith<_$_TestimonialListModel> get copyWith =>
      __$$_TestimonialListModelCopyWithImpl<_$_TestimonialListModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TestimonialListModelToJson(
      this,
    );
  }
}

abstract class _TestimonialListModel implements TestimonialListModel {
  factory _TestimonialListModel(
      {required final String status,
      required final int code,
      required final String message,
      final List<TestimonialModel>? data}) = _$_TestimonialListModel;

  factory _TestimonialListModel.fromJson(Map<String, dynamic> json) =
      _$_TestimonialListModel.fromJson;

  @override
  String get status;
  @override
  int get code;
  @override
  String get message;
  @override
  List<TestimonialModel>? get data;
  @override
  @JsonKey(ignore: true)
  _$$_TestimonialListModelCopyWith<_$_TestimonialListModel> get copyWith =>
      throw _privateConstructorUsedError;
}
