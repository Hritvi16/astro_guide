// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'TransactionResponseModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransactionResponseModel _$TransactionResponseModelFromJson(
    Map<String, dynamic> json) {
  return _TransactionResponseModel.fromJson(json);
}

/// @nodoc
mixin _$TransactionResponseModel {
  String get status => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  String? get transaction_id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionResponseModelCopyWith<TransactionResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionResponseModelCopyWith<$Res> {
  factory $TransactionResponseModelCopyWith(TransactionResponseModel value,
          $Res Function(TransactionResponseModel) then) =
      _$TransactionResponseModelCopyWithImpl<$Res, TransactionResponseModel>;
  @useResult
  $Res call(
      {String status,
      int code,
      String message,
      int? id,
      String? transaction_id});
}

/// @nodoc
class _$TransactionResponseModelCopyWithImpl<$Res,
        $Val extends TransactionResponseModel>
    implements $TransactionResponseModelCopyWith<$Res> {
  _$TransactionResponseModelCopyWithImpl(this._value, this._then);

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
    Object? transaction_id = freezed,
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
      transaction_id: freezed == transaction_id
          ? _value.transaction_id
          : transaction_id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TransactionResponseModelCopyWith<$Res>
    implements $TransactionResponseModelCopyWith<$Res> {
  factory _$$_TransactionResponseModelCopyWith(
          _$_TransactionResponseModel value,
          $Res Function(_$_TransactionResponseModel) then) =
      __$$_TransactionResponseModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String status,
      int code,
      String message,
      int? id,
      String? transaction_id});
}

/// @nodoc
class __$$_TransactionResponseModelCopyWithImpl<$Res>
    extends _$TransactionResponseModelCopyWithImpl<$Res,
        _$_TransactionResponseModel>
    implements _$$_TransactionResponseModelCopyWith<$Res> {
  __$$_TransactionResponseModelCopyWithImpl(_$_TransactionResponseModel _value,
      $Res Function(_$_TransactionResponseModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = null,
    Object? message = null,
    Object? id = freezed,
    Object? transaction_id = freezed,
  }) {
    return _then(_$_TransactionResponseModel(
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
      transaction_id: freezed == transaction_id
          ? _value.transaction_id
          : transaction_id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TransactionResponseModel implements _TransactionResponseModel {
  _$_TransactionResponseModel(
      {required this.status,
      required this.code,
      required this.message,
      this.id,
      this.transaction_id});

  factory _$_TransactionResponseModel.fromJson(Map<String, dynamic> json) =>
      _$$_TransactionResponseModelFromJson(json);

  @override
  final String status;
  @override
  final int code;
  @override
  final String message;
  @override
  final int? id;
  @override
  final String? transaction_id;

  @override
  String toString() {
    return 'TransactionResponseModel(status: $status, code: $code, message: $message, id: $id, transaction_id: $transaction_id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionResponseModel &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.transaction_id, transaction_id) ||
                other.transaction_id == transaction_id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, status, code, message, id, transaction_id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransactionResponseModelCopyWith<_$_TransactionResponseModel>
      get copyWith => __$$_TransactionResponseModelCopyWithImpl<
          _$_TransactionResponseModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransactionResponseModelToJson(
      this,
    );
  }
}

abstract class _TransactionResponseModel implements TransactionResponseModel {
  factory _TransactionResponseModel(
      {required final String status,
      required final int code,
      required final String message,
      final int? id,
      final String? transaction_id}) = _$_TransactionResponseModel;

  factory _TransactionResponseModel.fromJson(Map<String, dynamic> json) =
      _$_TransactionResponseModel.fromJson;

  @override
  String get status;
  @override
  int get code;
  @override
  String get message;
  @override
  int? get id;
  @override
  String? get transaction_id;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionResponseModelCopyWith<_$_TransactionResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}
