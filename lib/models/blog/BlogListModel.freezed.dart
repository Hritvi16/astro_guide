// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'BlogListModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BlogListModel _$BlogListModelFromJson(Map<String, dynamic> json) {
  return _BlogListModel.fromJson(json);
}

/// @nodoc
mixin _$BlogListModel {
  String get status => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<BlogModel>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BlogListModelCopyWith<BlogListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlogListModelCopyWith<$Res> {
  factory $BlogListModelCopyWith(
          BlogListModel value, $Res Function(BlogListModel) then) =
      _$BlogListModelCopyWithImpl<$Res, BlogListModel>;
  @useResult
  $Res call({String status, int code, String message, List<BlogModel>? data});
}

/// @nodoc
class _$BlogListModelCopyWithImpl<$Res, $Val extends BlogListModel>
    implements $BlogListModelCopyWith<$Res> {
  _$BlogListModelCopyWithImpl(this._value, this._then);

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
              as List<BlogModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BlogListModelCopyWith<$Res>
    implements $BlogListModelCopyWith<$Res> {
  factory _$$_BlogListModelCopyWith(
          _$_BlogListModel value, $Res Function(_$_BlogListModel) then) =
      __$$_BlogListModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, int code, String message, List<BlogModel>? data});
}

/// @nodoc
class __$$_BlogListModelCopyWithImpl<$Res>
    extends _$BlogListModelCopyWithImpl<$Res, _$_BlogListModel>
    implements _$$_BlogListModelCopyWith<$Res> {
  __$$_BlogListModelCopyWithImpl(
      _$_BlogListModel _value, $Res Function(_$_BlogListModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_$_BlogListModel(
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
              as List<BlogModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BlogListModel implements _BlogListModel {
  _$_BlogListModel(
      {required this.status,
      required this.code,
      required this.message,
      final List<BlogModel>? data})
      : _data = data;

  factory _$_BlogListModel.fromJson(Map<String, dynamic> json) =>
      _$$_BlogListModelFromJson(json);

  @override
  final String status;
  @override
  final int code;
  @override
  final String message;
  final List<BlogModel>? _data;
  @override
  List<BlogModel>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'BlogListModel(status: $status, code: $code, message: $message, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BlogListModel &&
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
  _$$_BlogListModelCopyWith<_$_BlogListModel> get copyWith =>
      __$$_BlogListModelCopyWithImpl<_$_BlogListModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BlogListModelToJson(
      this,
    );
  }
}

abstract class _BlogListModel implements BlogListModel {
  factory _BlogListModel(
      {required final String status,
      required final int code,
      required final String message,
      final List<BlogModel>? data}) = _$_BlogListModel;

  factory _BlogListModel.fromJson(Map<String, dynamic> json) =
      _$_BlogListModel.fromJson;

  @override
  String get status;
  @override
  int get code;
  @override
  String get message;
  @override
  List<BlogModel>? get data;
  @override
  @JsonKey(ignore: true)
  _$$_BlogListModelCopyWith<_$_BlogListModel> get copyWith =>
      throw _privateConstructorUsedError;
}
