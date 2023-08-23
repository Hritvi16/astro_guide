// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'CountryListModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CountryListModel _$CountryListModelFromJson(Map<String, dynamic> json) {
  return _CountryListModel.fromJson(json);
}

/// @nodoc
mixin _$CountryListModel {
  String get status => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<CountryModel> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CountryListModelCopyWith<CountryListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountryListModelCopyWith<$Res> {
  factory $CountryListModelCopyWith(
          CountryListModel value, $Res Function(CountryListModel) then) =
      _$CountryListModelCopyWithImpl<$Res, CountryListModel>;
  @useResult
  $Res call({String status, int code, String message, List<CountryModel> data});
}

/// @nodoc
class _$CountryListModelCopyWithImpl<$Res, $Val extends CountryListModel>
    implements $CountryListModelCopyWith<$Res> {
  _$CountryListModelCopyWithImpl(this._value, this._then);

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
              as List<CountryModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CountryListModelCopyWith<$Res>
    implements $CountryListModelCopyWith<$Res> {
  factory _$$_CountryListModelCopyWith(
          _$_CountryListModel value, $Res Function(_$_CountryListModel) then) =
      __$$_CountryListModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, int code, String message, List<CountryModel> data});
}

/// @nodoc
class __$$_CountryListModelCopyWithImpl<$Res>
    extends _$CountryListModelCopyWithImpl<$Res, _$_CountryListModel>
    implements _$$_CountryListModelCopyWith<$Res> {
  __$$_CountryListModelCopyWithImpl(
      _$_CountryListModel _value, $Res Function(_$_CountryListModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$_CountryListModel(
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
              as List<CountryModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CountryListModel implements _CountryListModel {
  _$_CountryListModel(
      {required this.status,
      required this.code,
      required this.message,
      required final List<CountryModel> data})
      : _data = data;

  factory _$_CountryListModel.fromJson(Map<String, dynamic> json) =>
      _$$_CountryListModelFromJson(json);

  @override
  final String status;
  @override
  final int code;
  @override
  final String message;
  final List<CountryModel> _data;
  @override
  List<CountryModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'CountryListModel(status: $status, code: $code, message: $message, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CountryListModel &&
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
  _$$_CountryListModelCopyWith<_$_CountryListModel> get copyWith =>
      __$$_CountryListModelCopyWithImpl<_$_CountryListModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CountryListModelToJson(
      this,
    );
  }
}

abstract class _CountryListModel implements CountryListModel {
  factory _CountryListModel(
      {required final String status,
      required final int code,
      required final String message,
      required final List<CountryModel> data}) = _$_CountryListModel;

  factory _CountryListModel.fromJson(Map<String, dynamic> json) =
      _$_CountryListModel.fromJson;

  @override
  String get status;
  @override
  int get code;
  @override
  String get message;
  @override
  List<CountryModel> get data;
  @override
  @JsonKey(ignore: true)
  _$$_CountryListModelCopyWith<_$_CountryListModel> get copyWith =>
      throw _privateConstructorUsedError;
}
