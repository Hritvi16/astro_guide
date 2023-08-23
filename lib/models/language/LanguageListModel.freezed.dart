// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'LanguageListModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LanguageListModel _$LanguageListModelFromJson(Map<String, dynamic> json) {
  return _LanguageListModel.fromJson(json);
}

/// @nodoc
mixin _$LanguageListModel {
  String get status => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<LanguageModel> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LanguageListModelCopyWith<LanguageListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LanguageListModelCopyWith<$Res> {
  factory $LanguageListModelCopyWith(
          LanguageListModel value, $Res Function(LanguageListModel) then) =
      _$LanguageListModelCopyWithImpl<$Res, LanguageListModel>;
  @useResult
  $Res call(
      {String status, int code, String message, List<LanguageModel> data});
}

/// @nodoc
class _$LanguageListModelCopyWithImpl<$Res, $Val extends LanguageListModel>
    implements $LanguageListModelCopyWith<$Res> {
  _$LanguageListModelCopyWithImpl(this._value, this._then);

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
              as List<LanguageModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LanguageListModelCopyWith<$Res>
    implements $LanguageListModelCopyWith<$Res> {
  factory _$$_LanguageListModelCopyWith(_$_LanguageListModel value,
          $Res Function(_$_LanguageListModel) then) =
      __$$_LanguageListModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String status, int code, String message, List<LanguageModel> data});
}

/// @nodoc
class __$$_LanguageListModelCopyWithImpl<$Res>
    extends _$LanguageListModelCopyWithImpl<$Res, _$_LanguageListModel>
    implements _$$_LanguageListModelCopyWith<$Res> {
  __$$_LanguageListModelCopyWithImpl(
      _$_LanguageListModel _value, $Res Function(_$_LanguageListModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$_LanguageListModel(
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
              as List<LanguageModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LanguageListModel implements _LanguageListModel {
  _$_LanguageListModel(
      {required this.status,
      required this.code,
      required this.message,
      required final List<LanguageModel> data})
      : _data = data;

  factory _$_LanguageListModel.fromJson(Map<String, dynamic> json) =>
      _$$_LanguageListModelFromJson(json);

  @override
  final String status;
  @override
  final int code;
  @override
  final String message;
  final List<LanguageModel> _data;
  @override
  List<LanguageModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'LanguageListModel(status: $status, code: $code, message: $message, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LanguageListModel &&
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
  _$$_LanguageListModelCopyWith<_$_LanguageListModel> get copyWith =>
      __$$_LanguageListModelCopyWithImpl<_$_LanguageListModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LanguageListModelToJson(
      this,
    );
  }
}

abstract class _LanguageListModel implements LanguageListModel {
  factory _LanguageListModel(
      {required final String status,
      required final int code,
      required final String message,
      required final List<LanguageModel> data}) = _$_LanguageListModel;

  factory _LanguageListModel.fromJson(Map<String, dynamic> json) =
      _$_LanguageListModel.fromJson;

  @override
  String get status;
  @override
  int get code;
  @override
  String get message;
  @override
  List<LanguageModel> get data;
  @override
  @JsonKey(ignore: true)
  _$$_LanguageListModelCopyWith<_$_LanguageListModel> get copyWith =>
      throw _privateConstructorUsedError;
}
