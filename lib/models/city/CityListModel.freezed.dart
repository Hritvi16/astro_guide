// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'CityListModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CityListModel _$CityListModelFromJson(Map<String, dynamic> json) {
  return _CityListModel.fromJson(json);
}

/// @nodoc
mixin _$CityListModel {
  String get status => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<CityModel>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CityListModelCopyWith<CityListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CityListModelCopyWith<$Res> {
  factory $CityListModelCopyWith(
          CityListModel value, $Res Function(CityListModel) then) =
      _$CityListModelCopyWithImpl<$Res, CityListModel>;
  @useResult
  $Res call({String status, int code, String message, List<CityModel>? data});
}

/// @nodoc
class _$CityListModelCopyWithImpl<$Res, $Val extends CityListModel>
    implements $CityListModelCopyWith<$Res> {
  _$CityListModelCopyWithImpl(this._value, this._then);

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
              as List<CityModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CityListModelImplCopyWith<$Res>
    implements $CityListModelCopyWith<$Res> {
  factory _$$CityListModelImplCopyWith(
          _$CityListModelImpl value, $Res Function(_$CityListModelImpl) then) =
      __$$CityListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, int code, String message, List<CityModel>? data});
}

/// @nodoc
class __$$CityListModelImplCopyWithImpl<$Res>
    extends _$CityListModelCopyWithImpl<$Res, _$CityListModelImpl>
    implements _$$CityListModelImplCopyWith<$Res> {
  __$$CityListModelImplCopyWithImpl(
      _$CityListModelImpl _value, $Res Function(_$CityListModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_$CityListModelImpl(
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
              as List<CityModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CityListModelImpl implements _CityListModel {
  _$CityListModelImpl(
      {required this.status,
      required this.code,
      required this.message,
      final List<CityModel>? data})
      : _data = data;

  factory _$CityListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CityListModelImplFromJson(json);

  @override
  final String status;
  @override
  final int code;
  @override
  final String message;
  final List<CityModel>? _data;
  @override
  List<CityModel>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CityListModel(status: $status, code: $code, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CityListModelImpl &&
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
  _$$CityListModelImplCopyWith<_$CityListModelImpl> get copyWith =>
      __$$CityListModelImplCopyWithImpl<_$CityListModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CityListModelImplToJson(
      this,
    );
  }
}

abstract class _CityListModel implements CityListModel {
  factory _CityListModel(
      {required final String status,
      required final int code,
      required final String message,
      final List<CityModel>? data}) = _$CityListModelImpl;

  factory _CityListModel.fromJson(Map<String, dynamic> json) =
      _$CityListModelImpl.fromJson;

  @override
  String get status;
  @override
  int get code;
  @override
  String get message;
  @override
  List<CityModel>? get data;
  @override
  @JsonKey(ignore: true)
  _$$CityListModelImplCopyWith<_$CityListModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
