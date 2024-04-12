// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'AstrologerListModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AstrologerListModel _$AstrologerListModelFromJson(Map<String, dynamic> json) {
  return _AstrologerListModel.fromJson(json);
}

/// @nodoc
mixin _$AstrologerListModel {
  String get status => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<AstrologerModel>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AstrologerListModelCopyWith<AstrologerListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AstrologerListModelCopyWith<$Res> {
  factory $AstrologerListModelCopyWith(
          AstrologerListModel value, $Res Function(AstrologerListModel) then) =
      _$AstrologerListModelCopyWithImpl<$Res, AstrologerListModel>;
  @useResult
  $Res call(
      {String status, int code, String message, List<AstrologerModel>? data});
}

/// @nodoc
class _$AstrologerListModelCopyWithImpl<$Res, $Val extends AstrologerListModel>
    implements $AstrologerListModelCopyWith<$Res> {
  _$AstrologerListModelCopyWithImpl(this._value, this._then);

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
              as List<AstrologerModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AstrologerListModelImplCopyWith<$Res>
    implements $AstrologerListModelCopyWith<$Res> {
  factory _$$AstrologerListModelImplCopyWith(_$AstrologerListModelImpl value,
          $Res Function(_$AstrologerListModelImpl) then) =
      __$$AstrologerListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String status, int code, String message, List<AstrologerModel>? data});
}

/// @nodoc
class __$$AstrologerListModelImplCopyWithImpl<$Res>
    extends _$AstrologerListModelCopyWithImpl<$Res, _$AstrologerListModelImpl>
    implements _$$AstrologerListModelImplCopyWith<$Res> {
  __$$AstrologerListModelImplCopyWithImpl(_$AstrologerListModelImpl _value,
      $Res Function(_$AstrologerListModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_$AstrologerListModelImpl(
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
              as List<AstrologerModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AstrologerListModelImpl implements _AstrologerListModel {
  _$AstrologerListModelImpl(
      {required this.status,
      required this.code,
      required this.message,
      final List<AstrologerModel>? data})
      : _data = data;

  factory _$AstrologerListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AstrologerListModelImplFromJson(json);

  @override
  final String status;
  @override
  final int code;
  @override
  final String message;
  final List<AstrologerModel>? _data;
  @override
  List<AstrologerModel>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AstrologerListModel(status: $status, code: $code, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AstrologerListModelImpl &&
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
  _$$AstrologerListModelImplCopyWith<_$AstrologerListModelImpl> get copyWith =>
      __$$AstrologerListModelImplCopyWithImpl<_$AstrologerListModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AstrologerListModelImplToJson(
      this,
    );
  }
}

abstract class _AstrologerListModel implements AstrologerListModel {
  factory _AstrologerListModel(
      {required final String status,
      required final int code,
      required final String message,
      final List<AstrologerModel>? data}) = _$AstrologerListModelImpl;

  factory _AstrologerListModel.fromJson(Map<String, dynamic> json) =
      _$AstrologerListModelImpl.fromJson;

  @override
  String get status;
  @override
  int get code;
  @override
  String get message;
  @override
  List<AstrologerModel>? get data;
  @override
  @JsonKey(ignore: true)
  _$$AstrologerListModelImplCopyWith<_$AstrologerListModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
