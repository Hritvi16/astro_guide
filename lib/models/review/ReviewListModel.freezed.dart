// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ReviewListModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReviewListModel _$ReviewListModelFromJson(Map<String, dynamic> json) {
  return _ReviewListModel.fromJson(json);
}

/// @nodoc
mixin _$ReviewListModel {
  String get status => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<ReviewModel>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReviewListModelCopyWith<ReviewListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewListModelCopyWith<$Res> {
  factory $ReviewListModelCopyWith(
          ReviewListModel value, $Res Function(ReviewListModel) then) =
      _$ReviewListModelCopyWithImpl<$Res, ReviewListModel>;
  @useResult
  $Res call({String status, int code, String message, List<ReviewModel>? data});
}

/// @nodoc
class _$ReviewListModelCopyWithImpl<$Res, $Val extends ReviewListModel>
    implements $ReviewListModelCopyWith<$Res> {
  _$ReviewListModelCopyWithImpl(this._value, this._then);

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
              as List<ReviewModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReviewListModelCopyWith<$Res>
    implements $ReviewListModelCopyWith<$Res> {
  factory _$$_ReviewListModelCopyWith(
          _$_ReviewListModel value, $Res Function(_$_ReviewListModel) then) =
      __$$_ReviewListModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, int code, String message, List<ReviewModel>? data});
}

/// @nodoc
class __$$_ReviewListModelCopyWithImpl<$Res>
    extends _$ReviewListModelCopyWithImpl<$Res, _$_ReviewListModel>
    implements _$$_ReviewListModelCopyWith<$Res> {
  __$$_ReviewListModelCopyWithImpl(
      _$_ReviewListModel _value, $Res Function(_$_ReviewListModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_$_ReviewListModel(
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
              as List<ReviewModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReviewListModel implements _ReviewListModel {
  _$_ReviewListModel(
      {required this.status,
      required this.code,
      required this.message,
      final List<ReviewModel>? data})
      : _data = data;

  factory _$_ReviewListModel.fromJson(Map<String, dynamic> json) =>
      _$$_ReviewListModelFromJson(json);

  @override
  final String status;
  @override
  final int code;
  @override
  final String message;
  final List<ReviewModel>? _data;
  @override
  List<ReviewModel>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ReviewListModel(status: $status, code: $code, message: $message, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReviewListModel &&
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
  _$$_ReviewListModelCopyWith<_$_ReviewListModel> get copyWith =>
      __$$_ReviewListModelCopyWithImpl<_$_ReviewListModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReviewListModelToJson(
      this,
    );
  }
}

abstract class _ReviewListModel implements ReviewListModel {
  factory _ReviewListModel(
      {required final String status,
      required final int code,
      required final String message,
      final List<ReviewModel>? data}) = _$_ReviewListModel;

  factory _ReviewListModel.fromJson(Map<String, dynamic> json) =
      _$_ReviewListModel.fromJson;

  @override
  String get status;
  @override
  int get code;
  @override
  String get message;
  @override
  List<ReviewModel>? get data;
  @override
  @JsonKey(ignore: true)
  _$$_ReviewListModelCopyWith<_$_ReviewListModel> get copyWith =>
      throw _privateConstructorUsedError;
}
