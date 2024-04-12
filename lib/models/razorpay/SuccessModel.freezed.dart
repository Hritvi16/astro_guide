// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'SuccessModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SuccessModel _$SuccessModelFromJson(Map<String, dynamic> json) {
  return _SuccessModel.fromJson(json);
}

/// @nodoc
mixin _$SuccessModel {
  String? get orderId => throw _privateConstructorUsedError;
  String? get paymentId => throw _privateConstructorUsedError;
  String? get signature => throw _privateConstructorUsedError;
  String? get wallet => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SuccessModelCopyWith<SuccessModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SuccessModelCopyWith<$Res> {
  factory $SuccessModelCopyWith(
          SuccessModel value, $Res Function(SuccessModel) then) =
      _$SuccessModelCopyWithImpl<$Res, SuccessModel>;
  @useResult
  $Res call(
      {String? orderId, String? paymentId, String? signature, String? wallet});
}

/// @nodoc
class _$SuccessModelCopyWithImpl<$Res, $Val extends SuccessModel>
    implements $SuccessModelCopyWith<$Res> {
  _$SuccessModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = freezed,
    Object? paymentId = freezed,
    Object? signature = freezed,
    Object? wallet = freezed,
  }) {
    return _then(_value.copyWith(
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentId: freezed == paymentId
          ? _value.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as String?,
      signature: freezed == signature
          ? _value.signature
          : signature // ignore: cast_nullable_to_non_nullable
              as String?,
      wallet: freezed == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SuccessModelImplCopyWith<$Res>
    implements $SuccessModelCopyWith<$Res> {
  factory _$$SuccessModelImplCopyWith(
          _$SuccessModelImpl value, $Res Function(_$SuccessModelImpl) then) =
      __$$SuccessModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? orderId, String? paymentId, String? signature, String? wallet});
}

/// @nodoc
class __$$SuccessModelImplCopyWithImpl<$Res>
    extends _$SuccessModelCopyWithImpl<$Res, _$SuccessModelImpl>
    implements _$$SuccessModelImplCopyWith<$Res> {
  __$$SuccessModelImplCopyWithImpl(
      _$SuccessModelImpl _value, $Res Function(_$SuccessModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = freezed,
    Object? paymentId = freezed,
    Object? signature = freezed,
    Object? wallet = freezed,
  }) {
    return _then(_$SuccessModelImpl(
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentId: freezed == paymentId
          ? _value.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as String?,
      signature: freezed == signature
          ? _value.signature
          : signature // ignore: cast_nullable_to_non_nullable
              as String?,
      wallet: freezed == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SuccessModelImpl implements _SuccessModel {
  _$SuccessModelImpl(
      {this.orderId, this.paymentId, this.signature, this.wallet});

  factory _$SuccessModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SuccessModelImplFromJson(json);

  @override
  final String? orderId;
  @override
  final String? paymentId;
  @override
  final String? signature;
  @override
  final String? wallet;

  @override
  String toString() {
    return 'SuccessModel(orderId: $orderId, paymentId: $paymentId, signature: $signature, wallet: $wallet)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessModelImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.paymentId, paymentId) ||
                other.paymentId == paymentId) &&
            (identical(other.signature, signature) ||
                other.signature == signature) &&
            (identical(other.wallet, wallet) || other.wallet == wallet));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, orderId, paymentId, signature, wallet);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessModelImplCopyWith<_$SuccessModelImpl> get copyWith =>
      __$$SuccessModelImplCopyWithImpl<_$SuccessModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SuccessModelImplToJson(
      this,
    );
  }
}

abstract class _SuccessModel implements SuccessModel {
  factory _SuccessModel(
      {final String? orderId,
      final String? paymentId,
      final String? signature,
      final String? wallet}) = _$SuccessModelImpl;

  factory _SuccessModel.fromJson(Map<String, dynamic> json) =
      _$SuccessModelImpl.fromJson;

  @override
  String? get orderId;
  @override
  String? get paymentId;
  @override
  String? get signature;
  @override
  String? get wallet;
  @override
  @JsonKey(ignore: true)
  _$$SuccessModelImplCopyWith<_$SuccessModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
