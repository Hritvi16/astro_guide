// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'SupportResponseModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SupportResponseModel _$SupportResponseModelFromJson(Map<String, dynamic> json) {
  return _SupportResponseModel.fromJson(json);
}

/// @nodoc
mixin _$SupportResponseModel {
  String get status => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SupportResponseModelCopyWith<SupportResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SupportResponseModelCopyWith<$Res> {
  factory $SupportResponseModelCopyWith(SupportResponseModel value,
          $Res Function(SupportResponseModel) then) =
      _$SupportResponseModelCopyWithImpl<$Res, SupportResponseModel>;
  @useResult
  $Res call({String status, int code, String message, int? id});
}

/// @nodoc
class _$SupportResponseModelCopyWithImpl<$Res,
        $Val extends SupportResponseModel>
    implements $SupportResponseModelCopyWith<$Res> {
  _$SupportResponseModelCopyWithImpl(this._value, this._then);

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
    Object? id = freezed,
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
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SupportResponseModelCopyWith<$Res>
    implements $SupportResponseModelCopyWith<$Res> {
  factory _$$_SupportResponseModelCopyWith(_$_SupportResponseModel value,
          $Res Function(_$_SupportResponseModel) then) =
      __$$_SupportResponseModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, int code, String message, int? id});
}

/// @nodoc
class __$$_SupportResponseModelCopyWithImpl<$Res>
    extends _$SupportResponseModelCopyWithImpl<$Res, _$_SupportResponseModel>
    implements _$$_SupportResponseModelCopyWith<$Res> {
  __$$_SupportResponseModelCopyWithImpl(_$_SupportResponseModel _value,
      $Res Function(_$_SupportResponseModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = null,
    Object? message = null,
    Object? id = freezed,
  }) {
    return _then(_$_SupportResponseModel(
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
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SupportResponseModel implements _SupportResponseModel {
  _$_SupportResponseModel(
      {required this.status,
      required this.code,
      required this.message,
      this.id});

  factory _$_SupportResponseModel.fromJson(Map<String, dynamic> json) =>
      _$$_SupportResponseModelFromJson(json);

  @override
  final String status;
  @override
  final int code;
  @override
  final String message;
  @override
  final int? id;

  @override
  String toString() {
    return 'SupportResponseModel(status: $status, code: $code, message: $message, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SupportResponseModel &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, code, message, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SupportResponseModelCopyWith<_$_SupportResponseModel> get copyWith =>
      __$$_SupportResponseModelCopyWithImpl<_$_SupportResponseModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SupportResponseModelToJson(
      this,
    );
  }
}

abstract class _SupportResponseModel implements SupportResponseModel {
  factory _SupportResponseModel(
      {required final String status,
      required final int code,
      required final String message,
      final int? id}) = _$_SupportResponseModel;

  factory _SupportResponseModel.fromJson(Map<String, dynamic> json) =
      _$_SupportResponseModel.fromJson;

  @override
  String get status;
  @override
  int get code;
  @override
  String get message;
  @override
  int? get id;
  @override
  @JsonKey(ignore: true)
  _$$_SupportResponseModelCopyWith<_$_SupportResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}
