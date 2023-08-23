// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'PackageListModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PackageListModel _$PackageListModelFromJson(Map<String, dynamic> json) {
  return _PackageListModel.fromJson(json);
}

/// @nodoc
mixin _$PackageListModel {
  String get status => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<PackageModel>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PackageListModelCopyWith<PackageListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PackageListModelCopyWith<$Res> {
  factory $PackageListModelCopyWith(
          PackageListModel value, $Res Function(PackageListModel) then) =
      _$PackageListModelCopyWithImpl<$Res, PackageListModel>;
  @useResult
  $Res call(
      {String status, int code, String message, List<PackageModel>? data});
}

/// @nodoc
class _$PackageListModelCopyWithImpl<$Res, $Val extends PackageListModel>
    implements $PackageListModelCopyWith<$Res> {
  _$PackageListModelCopyWithImpl(this._value, this._then);

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
              as List<PackageModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PackageListModelCopyWith<$Res>
    implements $PackageListModelCopyWith<$Res> {
  factory _$$_PackageListModelCopyWith(
          _$_PackageListModel value, $Res Function(_$_PackageListModel) then) =
      __$$_PackageListModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String status, int code, String message, List<PackageModel>? data});
}

/// @nodoc
class __$$_PackageListModelCopyWithImpl<$Res>
    extends _$PackageListModelCopyWithImpl<$Res, _$_PackageListModel>
    implements _$$_PackageListModelCopyWith<$Res> {
  __$$_PackageListModelCopyWithImpl(
      _$_PackageListModel _value, $Res Function(_$_PackageListModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_$_PackageListModel(
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
              as List<PackageModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PackageListModel implements _PackageListModel {
  _$_PackageListModel(
      {required this.status,
      required this.code,
      required this.message,
      final List<PackageModel>? data})
      : _data = data;

  factory _$_PackageListModel.fromJson(Map<String, dynamic> json) =>
      _$$_PackageListModelFromJson(json);

  @override
  final String status;
  @override
  final int code;
  @override
  final String message;
  final List<PackageModel>? _data;
  @override
  List<PackageModel>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PackageListModel(status: $status, code: $code, message: $message, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PackageListModel &&
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
  _$$_PackageListModelCopyWith<_$_PackageListModel> get copyWith =>
      __$$_PackageListModelCopyWithImpl<_$_PackageListModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PackageListModelToJson(
      this,
    );
  }
}

abstract class _PackageListModel implements PackageListModel {
  factory _PackageListModel(
      {required final String status,
      required final int code,
      required final String message,
      final List<PackageModel>? data}) = _$_PackageListModel;

  factory _PackageListModel.fromJson(Map<String, dynamic> json) =
      _$_PackageListModel.fromJson;

  @override
  String get status;
  @override
  int get code;
  @override
  String get message;
  @override
  List<PackageModel>? get data;
  @override
  @JsonKey(ignore: true)
  _$$_PackageListModelCopyWith<_$_PackageListModel> get copyWith =>
      throw _privateConstructorUsedError;
}
