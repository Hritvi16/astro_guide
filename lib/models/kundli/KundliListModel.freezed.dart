// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'KundliListModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

KundliListModel _$KundliListModelFromJson(Map<String, dynamic> json) {
  return _KundliListModel.fromJson(json);
}

/// @nodoc
mixin _$KundliListModel {
  String get status => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<KundliModel>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KundliListModelCopyWith<KundliListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KundliListModelCopyWith<$Res> {
  factory $KundliListModelCopyWith(
          KundliListModel value, $Res Function(KundliListModel) then) =
      _$KundliListModelCopyWithImpl<$Res, KundliListModel>;
  @useResult
  $Res call({String status, int code, String message, List<KundliModel>? data});
}

/// @nodoc
class _$KundliListModelCopyWithImpl<$Res, $Val extends KundliListModel>
    implements $KundliListModelCopyWith<$Res> {
  _$KundliListModelCopyWithImpl(this._value, this._then);

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
              as List<KundliModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KundliListModelImplCopyWith<$Res>
    implements $KundliListModelCopyWith<$Res> {
  factory _$$KundliListModelImplCopyWith(_$KundliListModelImpl value,
          $Res Function(_$KundliListModelImpl) then) =
      __$$KundliListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, int code, String message, List<KundliModel>? data});
}

/// @nodoc
class __$$KundliListModelImplCopyWithImpl<$Res>
    extends _$KundliListModelCopyWithImpl<$Res, _$KundliListModelImpl>
    implements _$$KundliListModelImplCopyWith<$Res> {
  __$$KundliListModelImplCopyWithImpl(
      _$KundliListModelImpl _value, $Res Function(_$KundliListModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_$KundliListModelImpl(
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
              as List<KundliModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KundliListModelImpl implements _KundliListModel {
  _$KundliListModelImpl(
      {required this.status,
      required this.code,
      required this.message,
      final List<KundliModel>? data})
      : _data = data;

  factory _$KundliListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$KundliListModelImplFromJson(json);

  @override
  final String status;
  @override
  final int code;
  @override
  final String message;
  final List<KundliModel>? _data;
  @override
  List<KundliModel>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'KundliListModel(status: $status, code: $code, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KundliListModelImpl &&
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
  _$$KundliListModelImplCopyWith<_$KundliListModelImpl> get copyWith =>
      __$$KundliListModelImplCopyWithImpl<_$KundliListModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KundliListModelImplToJson(
      this,
    );
  }
}

abstract class _KundliListModel implements KundliListModel {
  factory _KundliListModel(
      {required final String status,
      required final int code,
      required final String message,
      final List<KundliModel>? data}) = _$KundliListModelImpl;

  factory _KundliListModel.fromJson(Map<String, dynamic> json) =
      _$KundliListModelImpl.fromJson;

  @override
  String get status;
  @override
  int get code;
  @override
  String get message;
  @override
  List<KundliModel>? get data;
  @override
  @JsonKey(ignore: true)
  _$$KundliListModelImplCopyWith<_$KundliListModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
