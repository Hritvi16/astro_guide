// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ReviewResponseModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReviewResponseModel _$ReviewResponseModelFromJson(Map<String, dynamic> json) {
  return _ReviewResponseModel.fromJson(json);
}

/// @nodoc
mixin _$ReviewResponseModel {
  String get status => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  ReviewModel? get data => throw _privateConstructorUsedError;
  int? get m_id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReviewResponseModelCopyWith<ReviewResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewResponseModelCopyWith<$Res> {
  factory $ReviewResponseModelCopyWith(
          ReviewResponseModel value, $Res Function(ReviewResponseModel) then) =
      _$ReviewResponseModelCopyWithImpl<$Res, ReviewResponseModel>;
  @useResult
  $Res call(
      {String status, int code, String message, ReviewModel? data, int? m_id});

  $ReviewModelCopyWith<$Res>? get data;
}

/// @nodoc
class _$ReviewResponseModelCopyWithImpl<$Res, $Val extends ReviewResponseModel>
    implements $ReviewResponseModelCopyWith<$Res> {
  _$ReviewResponseModelCopyWithImpl(this._value, this._then);

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
              as ReviewModel?,
      m_id: freezed == m_id
          ? _value.m_id
          : m_id // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ReviewModelCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $ReviewModelCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReviewResponseModelImplCopyWith<$Res>
    implements $ReviewResponseModelCopyWith<$Res> {
  factory _$$ReviewResponseModelImplCopyWith(_$ReviewResponseModelImpl value,
          $Res Function(_$ReviewResponseModelImpl) then) =
      __$$ReviewResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String status, int code, String message, ReviewModel? data, int? m_id});

  @override
  $ReviewModelCopyWith<$Res>? get data;
}

/// @nodoc
class __$$ReviewResponseModelImplCopyWithImpl<$Res>
    extends _$ReviewResponseModelCopyWithImpl<$Res, _$ReviewResponseModelImpl>
    implements _$$ReviewResponseModelImplCopyWith<$Res> {
  __$$ReviewResponseModelImplCopyWithImpl(_$ReviewResponseModelImpl _value,
      $Res Function(_$ReviewResponseModelImpl) _then)
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
    return _then(_$ReviewResponseModelImpl(
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
              as ReviewModel?,
      m_id: freezed == m_id
          ? _value.m_id
          : m_id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReviewResponseModelImpl implements _ReviewResponseModel {
  _$ReviewResponseModelImpl(
      {required this.status,
      required this.code,
      required this.message,
      this.data,
      this.m_id});

  factory _$ReviewResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewResponseModelImplFromJson(json);

  @override
  final String status;
  @override
  final int code;
  @override
  final String message;
  @override
  final ReviewModel? data;
  @override
  final int? m_id;

  @override
  String toString() {
    return 'ReviewResponseModel(status: $status, code: $code, message: $message, data: $data, m_id: $m_id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewResponseModelImpl &&
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
  _$$ReviewResponseModelImplCopyWith<_$ReviewResponseModelImpl> get copyWith =>
      __$$ReviewResponseModelImplCopyWithImpl<_$ReviewResponseModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewResponseModelImplToJson(
      this,
    );
  }
}

abstract class _ReviewResponseModel implements ReviewResponseModel {
  factory _ReviewResponseModel(
      {required final String status,
      required final int code,
      required final String message,
      final ReviewModel? data,
      final int? m_id}) = _$ReviewResponseModelImpl;

  factory _ReviewResponseModel.fromJson(Map<String, dynamic> json) =
      _$ReviewResponseModelImpl.fromJson;

  @override
  String get status;
  @override
  int get code;
  @override
  String get message;
  @override
  ReviewModel? get data;
  @override
  int? get m_id;
  @override
  @JsonKey(ignore: true)
  _$$ReviewResponseModelImplCopyWith<_$ReviewResponseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
