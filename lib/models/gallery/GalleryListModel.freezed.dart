// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'GalleryListModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GalleryListModel _$GalleryListModelFromJson(Map<String, dynamic> json) {
  return _GalleryListModel.fromJson(json);
}

/// @nodoc
mixin _$GalleryListModel {
  String get status => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<GalleryModel>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GalleryListModelCopyWith<GalleryListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GalleryListModelCopyWith<$Res> {
  factory $GalleryListModelCopyWith(
          GalleryListModel value, $Res Function(GalleryListModel) then) =
      _$GalleryListModelCopyWithImpl<$Res, GalleryListModel>;
  @useResult
  $Res call(
      {String status, int code, String message, List<GalleryModel>? data});
}

/// @nodoc
class _$GalleryListModelCopyWithImpl<$Res, $Val extends GalleryListModel>
    implements $GalleryListModelCopyWith<$Res> {
  _$GalleryListModelCopyWithImpl(this._value, this._then);

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
              as List<GalleryModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GalleryListModelImplCopyWith<$Res>
    implements $GalleryListModelCopyWith<$Res> {
  factory _$$GalleryListModelImplCopyWith(_$GalleryListModelImpl value,
          $Res Function(_$GalleryListModelImpl) then) =
      __$$GalleryListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String status, int code, String message, List<GalleryModel>? data});
}

/// @nodoc
class __$$GalleryListModelImplCopyWithImpl<$Res>
    extends _$GalleryListModelCopyWithImpl<$Res, _$GalleryListModelImpl>
    implements _$$GalleryListModelImplCopyWith<$Res> {
  __$$GalleryListModelImplCopyWithImpl(_$GalleryListModelImpl _value,
      $Res Function(_$GalleryListModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_$GalleryListModelImpl(
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
              as List<GalleryModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GalleryListModelImpl implements _GalleryListModel {
  _$GalleryListModelImpl(
      {required this.status,
      required this.code,
      required this.message,
      final List<GalleryModel>? data})
      : _data = data;

  factory _$GalleryListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GalleryListModelImplFromJson(json);

  @override
  final String status;
  @override
  final int code;
  @override
  final String message;
  final List<GalleryModel>? _data;
  @override
  List<GalleryModel>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'GalleryListModel(status: $status, code: $code, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GalleryListModelImpl &&
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
  _$$GalleryListModelImplCopyWith<_$GalleryListModelImpl> get copyWith =>
      __$$GalleryListModelImplCopyWithImpl<_$GalleryListModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GalleryListModelImplToJson(
      this,
    );
  }
}

abstract class _GalleryListModel implements GalleryListModel {
  factory _GalleryListModel(
      {required final String status,
      required final int code,
      required final String message,
      final List<GalleryModel>? data}) = _$GalleryListModelImpl;

  factory _GalleryListModel.fromJson(Map<String, dynamic> json) =
      _$GalleryListModelImpl.fromJson;

  @override
  String get status;
  @override
  int get code;
  @override
  String get message;
  @override
  List<GalleryModel>? get data;
  @override
  @JsonKey(ignore: true)
  _$$GalleryListModelImplCopyWith<_$GalleryListModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
