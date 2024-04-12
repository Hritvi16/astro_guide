// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'SupportListModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SupportListModel _$SupportListModelFromJson(Map<String, dynamic> json) {
  return _SupportListModel.fromJson(json);
}

/// @nodoc
mixin _$SupportListModel {
  String get status => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<SupportModel>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SupportListModelCopyWith<SupportListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SupportListModelCopyWith<$Res> {
  factory $SupportListModelCopyWith(
          SupportListModel value, $Res Function(SupportListModel) then) =
      _$SupportListModelCopyWithImpl<$Res, SupportListModel>;
  @useResult
  $Res call(
      {String status, int code, String message, List<SupportModel>? data});
}

/// @nodoc
class _$SupportListModelCopyWithImpl<$Res, $Val extends SupportListModel>
    implements $SupportListModelCopyWith<$Res> {
  _$SupportListModelCopyWithImpl(this._value, this._then);

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
              as List<SupportModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SupportListModelImplCopyWith<$Res>
    implements $SupportListModelCopyWith<$Res> {
  factory _$$SupportListModelImplCopyWith(_$SupportListModelImpl value,
          $Res Function(_$SupportListModelImpl) then) =
      __$$SupportListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String status, int code, String message, List<SupportModel>? data});
}

/// @nodoc
class __$$SupportListModelImplCopyWithImpl<$Res>
    extends _$SupportListModelCopyWithImpl<$Res, _$SupportListModelImpl>
    implements _$$SupportListModelImplCopyWith<$Res> {
  __$$SupportListModelImplCopyWithImpl(_$SupportListModelImpl _value,
      $Res Function(_$SupportListModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_$SupportListModelImpl(
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
              as List<SupportModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SupportListModelImpl implements _SupportListModel {
  _$SupportListModelImpl(
      {required this.status,
      required this.code,
      required this.message,
      final List<SupportModel>? data})
      : _data = data;

  factory _$SupportListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SupportListModelImplFromJson(json);

  @override
  final String status;
  @override
  final int code;
  @override
  final String message;
  final List<SupportModel>? _data;
  @override
  List<SupportModel>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SupportListModel(status: $status, code: $code, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SupportListModelImpl &&
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
  _$$SupportListModelImplCopyWith<_$SupportListModelImpl> get copyWith =>
      __$$SupportListModelImplCopyWithImpl<_$SupportListModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SupportListModelImplToJson(
      this,
    );
  }
}

abstract class _SupportListModel implements SupportListModel {
  factory _SupportListModel(
      {required final String status,
      required final int code,
      required final String message,
      final List<SupportModel>? data}) = _$SupportListModelImpl;

  factory _SupportListModel.fromJson(Map<String, dynamic> json) =
      _$SupportListModelImpl.fromJson;

  @override
  String get status;
  @override
  int get code;
  @override
  String get message;
  @override
  List<SupportModel>? get data;
  @override
  @JsonKey(ignore: true)
  _$$SupportListModelImplCopyWith<_$SupportListModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
