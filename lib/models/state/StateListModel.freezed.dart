// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'StateListModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StateListModel _$StateListModelFromJson(Map<String, dynamic> json) {
  return _StateListModel.fromJson(json);
}

/// @nodoc
mixin _$StateListModel {
  String get status => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<StateModel> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StateListModelCopyWith<StateListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StateListModelCopyWith<$Res> {
  factory $StateListModelCopyWith(
          StateListModel value, $Res Function(StateListModel) then) =
      _$StateListModelCopyWithImpl<$Res, StateListModel>;
  @useResult
  $Res call({String status, int code, String message, List<StateModel> data});
}

/// @nodoc
class _$StateListModelCopyWithImpl<$Res, $Val extends StateListModel>
    implements $StateListModelCopyWith<$Res> {
  _$StateListModelCopyWithImpl(this._value, this._then);

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
    Object? data = null,
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
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<StateModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StateListModelImplCopyWith<$Res>
    implements $StateListModelCopyWith<$Res> {
  factory _$$StateListModelImplCopyWith(_$StateListModelImpl value,
          $Res Function(_$StateListModelImpl) then) =
      __$$StateListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, int code, String message, List<StateModel> data});
}

/// @nodoc
class __$$StateListModelImplCopyWithImpl<$Res>
    extends _$StateListModelCopyWithImpl<$Res, _$StateListModelImpl>
    implements _$$StateListModelImplCopyWith<$Res> {
  __$$StateListModelImplCopyWithImpl(
      _$StateListModelImpl _value, $Res Function(_$StateListModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$StateListModelImpl(
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
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<StateModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StateListModelImpl implements _StateListModel {
  _$StateListModelImpl(
      {required this.status,
      required this.code,
      required this.message,
      required final List<StateModel> data})
      : _data = data;

  factory _$StateListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StateListModelImplFromJson(json);

  @override
  final String status;
  @override
  final int code;
  @override
  final String message;
  final List<StateModel> _data;
  @override
  List<StateModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'StateListModel(status: $status, code: $code, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StateListModelImpl &&
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
  _$$StateListModelImplCopyWith<_$StateListModelImpl> get copyWith =>
      __$$StateListModelImplCopyWithImpl<_$StateListModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StateListModelImplToJson(
      this,
    );
  }
}

abstract class _StateListModel implements StateListModel {
  factory _StateListModel(
      {required final String status,
      required final int code,
      required final String message,
      required final List<StateModel> data}) = _$StateListModelImpl;

  factory _StateListModel.fromJson(Map<String, dynamic> json) =
      _$StateListModelImpl.fromJson;

  @override
  String get status;
  @override
  int get code;
  @override
  String get message;
  @override
  List<StateModel> get data;
  @override
  @JsonKey(ignore: true)
  _$$StateListModelImplCopyWith<_$StateListModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
