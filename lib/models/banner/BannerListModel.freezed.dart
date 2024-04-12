// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'BannerListModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BannerListModel _$BannerListModelFromJson(Map<String, dynamic> json) {
  return _BannerListModel.fromJson(json);
}

/// @nodoc
mixin _$BannerListModel {
  String get status => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<BannerModel>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BannerListModelCopyWith<BannerListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BannerListModelCopyWith<$Res> {
  factory $BannerListModelCopyWith(
          BannerListModel value, $Res Function(BannerListModel) then) =
      _$BannerListModelCopyWithImpl<$Res, BannerListModel>;
  @useResult
  $Res call({String status, int code, String message, List<BannerModel>? data});
}

/// @nodoc
class _$BannerListModelCopyWithImpl<$Res, $Val extends BannerListModel>
    implements $BannerListModelCopyWith<$Res> {
  _$BannerListModelCopyWithImpl(this._value, this._then);

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
              as List<BannerModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BannerListModelImplCopyWith<$Res>
    implements $BannerListModelCopyWith<$Res> {
  factory _$$BannerListModelImplCopyWith(_$BannerListModelImpl value,
          $Res Function(_$BannerListModelImpl) then) =
      __$$BannerListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, int code, String message, List<BannerModel>? data});
}

/// @nodoc
class __$$BannerListModelImplCopyWithImpl<$Res>
    extends _$BannerListModelCopyWithImpl<$Res, _$BannerListModelImpl>
    implements _$$BannerListModelImplCopyWith<$Res> {
  __$$BannerListModelImplCopyWithImpl(
      _$BannerListModelImpl _value, $Res Function(_$BannerListModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_$BannerListModelImpl(
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
              as List<BannerModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BannerListModelImpl implements _BannerListModel {
  _$BannerListModelImpl(
      {required this.status,
      required this.code,
      required this.message,
      final List<BannerModel>? data})
      : _data = data;

  factory _$BannerListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BannerListModelImplFromJson(json);

  @override
  final String status;
  @override
  final int code;
  @override
  final String message;
  final List<BannerModel>? _data;
  @override
  List<BannerModel>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'BannerListModel(status: $status, code: $code, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BannerListModelImpl &&
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
  _$$BannerListModelImplCopyWith<_$BannerListModelImpl> get copyWith =>
      __$$BannerListModelImplCopyWithImpl<_$BannerListModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BannerListModelImplToJson(
      this,
    );
  }
}

abstract class _BannerListModel implements BannerListModel {
  factory _BannerListModel(
      {required final String status,
      required final int code,
      required final String message,
      final List<BannerModel>? data}) = _$BannerListModelImpl;

  factory _BannerListModel.fromJson(Map<String, dynamic> json) =
      _$BannerListModelImpl.fromJson;

  @override
  String get status;
  @override
  int get code;
  @override
  String get message;
  @override
  List<BannerModel>? get data;
  @override
  @JsonKey(ignore: true)
  _$$BannerListModelImplCopyWith<_$BannerListModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
