// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'TypeListModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TypeListModel _$TypeListModelFromJson(Map<String, dynamic> json) {
  return _TypeListModel.fromJson(json);
}

/// @nodoc
mixin _$TypeListModel {
  String get status => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<TypeModel>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TypeListModelCopyWith<TypeListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TypeListModelCopyWith<$Res> {
  factory $TypeListModelCopyWith(
          TypeListModel value, $Res Function(TypeListModel) then) =
      _$TypeListModelCopyWithImpl<$Res, TypeListModel>;
  @useResult
  $Res call({String status, int code, String message, List<TypeModel>? data});
}

/// @nodoc
class _$TypeListModelCopyWithImpl<$Res, $Val extends TypeListModel>
    implements $TypeListModelCopyWith<$Res> {
  _$TypeListModelCopyWithImpl(this._value, this._then);

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
              as List<TypeModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TypeListModelCopyWith<$Res>
    implements $TypeListModelCopyWith<$Res> {
  factory _$$_TypeListModelCopyWith(
          _$_TypeListModel value, $Res Function(_$_TypeListModel) then) =
      __$$_TypeListModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, int code, String message, List<TypeModel>? data});
}

/// @nodoc
class __$$_TypeListModelCopyWithImpl<$Res>
    extends _$TypeListModelCopyWithImpl<$Res, _$_TypeListModel>
    implements _$$_TypeListModelCopyWith<$Res> {
  __$$_TypeListModelCopyWithImpl(
      _$_TypeListModel _value, $Res Function(_$_TypeListModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_$_TypeListModel(
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
              as List<TypeModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TypeListModel implements _TypeListModel {
  _$_TypeListModel(
      {required this.status,
      required this.code,
      required this.message,
      final List<TypeModel>? data})
      : _data = data;

  factory _$_TypeListModel.fromJson(Map<String, dynamic> json) =>
      _$$_TypeListModelFromJson(json);

  @override
  final String status;
  @override
  final int code;
  @override
  final String message;
  final List<TypeModel>? _data;
  @override
  List<TypeModel>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'TypeListModel(status: $status, code: $code, message: $message, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TypeListModel &&
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
  _$$_TypeListModelCopyWith<_$_TypeListModel> get copyWith =>
      __$$_TypeListModelCopyWithImpl<_$_TypeListModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TypeListModelToJson(
      this,
    );
  }
}

abstract class _TypeListModel implements TypeListModel {
  factory _TypeListModel(
      {required final String status,
      required final int code,
      required final String message,
      final List<TypeModel>? data}) = _$_TypeListModel;

  factory _TypeListModel.fromJson(Map<String, dynamic> json) =
      _$_TypeListModel.fromJson;

  @override
  String get status;
  @override
  int get code;
  @override
  String get message;
  @override
  List<TypeModel>? get data;
  @override
  @JsonKey(ignore: true)
  _$$_TypeListModelCopyWith<_$_TypeListModel> get copyWith =>
      throw _privateConstructorUsedError;
}
