// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'VideoListModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VideoListModel _$VideoListModelFromJson(Map<String, dynamic> json) {
  return _VideoListModel.fromJson(json);
}

/// @nodoc
mixin _$VideoListModel {
  String get status => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<VideoModel>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VideoListModelCopyWith<VideoListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoListModelCopyWith<$Res> {
  factory $VideoListModelCopyWith(
          VideoListModel value, $Res Function(VideoListModel) then) =
      _$VideoListModelCopyWithImpl<$Res, VideoListModel>;
  @useResult
  $Res call({String status, int code, String message, List<VideoModel>? data});
}

/// @nodoc
class _$VideoListModelCopyWithImpl<$Res, $Val extends VideoListModel>
    implements $VideoListModelCopyWith<$Res> {
  _$VideoListModelCopyWithImpl(this._value, this._then);

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
              as List<VideoModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_VideoListModelCopyWith<$Res>
    implements $VideoListModelCopyWith<$Res> {
  factory _$$_VideoListModelCopyWith(
          _$_VideoListModel value, $Res Function(_$_VideoListModel) then) =
      __$$_VideoListModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, int code, String message, List<VideoModel>? data});
}

/// @nodoc
class __$$_VideoListModelCopyWithImpl<$Res>
    extends _$VideoListModelCopyWithImpl<$Res, _$_VideoListModel>
    implements _$$_VideoListModelCopyWith<$Res> {
  __$$_VideoListModelCopyWithImpl(
      _$_VideoListModel _value, $Res Function(_$_VideoListModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_$_VideoListModel(
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
              as List<VideoModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_VideoListModel implements _VideoListModel {
  _$_VideoListModel(
      {required this.status,
      required this.code,
      required this.message,
      final List<VideoModel>? data})
      : _data = data;

  factory _$_VideoListModel.fromJson(Map<String, dynamic> json) =>
      _$$_VideoListModelFromJson(json);

  @override
  final String status;
  @override
  final int code;
  @override
  final String message;
  final List<VideoModel>? _data;
  @override
  List<VideoModel>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'VideoListModel(status: $status, code: $code, message: $message, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VideoListModel &&
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
  _$$_VideoListModelCopyWith<_$_VideoListModel> get copyWith =>
      __$$_VideoListModelCopyWithImpl<_$_VideoListModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VideoListModelToJson(
      this,
    );
  }
}

abstract class _VideoListModel implements VideoListModel {
  factory _VideoListModel(
      {required final String status,
      required final int code,
      required final String message,
      final List<VideoModel>? data}) = _$_VideoListModel;

  factory _VideoListModel.fromJson(Map<String, dynamic> json) =
      _$_VideoListModel.fromJson;

  @override
  String get status;
  @override
  int get code;
  @override
  String get message;
  @override
  List<VideoModel>? get data;
  @override
  @JsonKey(ignore: true)
  _$$_VideoListModelCopyWith<_$_VideoListModel> get copyWith =>
      throw _privateConstructorUsedError;
}
