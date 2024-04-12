// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'PaymentModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaymentModel _$PaymentModelFromJson(Map<String, dynamic> json) {
  return _PaymentModel.fromJson(json);
}

/// @nodoc
mixin _$PaymentModel {
  String get id => throw _privateConstructorUsedError;
  String get entity => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  double get amount_paid => throw _privateConstructorUsedError;
  double get amount_due => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  String get receipt => throw _privateConstructorUsedError;
  int? get offer_id => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  int get created_at => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentModelCopyWith<PaymentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentModelCopyWith<$Res> {
  factory $PaymentModelCopyWith(
          PaymentModel value, $Res Function(PaymentModel) then) =
      _$PaymentModelCopyWithImpl<$Res, PaymentModel>;
  @useResult
  $Res call(
      {String id,
      String entity,
      double amount,
      double amount_paid,
      double amount_due,
      String currency,
      String receipt,
      int? offer_id,
      String status,
      int created_at});
}

/// @nodoc
class _$PaymentModelCopyWithImpl<$Res, $Val extends PaymentModel>
    implements $PaymentModelCopyWith<$Res> {
  _$PaymentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? entity = null,
    Object? amount = null,
    Object? amount_paid = null,
    Object? amount_due = null,
    Object? currency = null,
    Object? receipt = null,
    Object? offer_id = freezed,
    Object? status = null,
    Object? created_at = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      entity: null == entity
          ? _value.entity
          : entity // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      amount_paid: null == amount_paid
          ? _value.amount_paid
          : amount_paid // ignore: cast_nullable_to_non_nullable
              as double,
      amount_due: null == amount_due
          ? _value.amount_due
          : amount_due // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      receipt: null == receipt
          ? _value.receipt
          : receipt // ignore: cast_nullable_to_non_nullable
              as String,
      offer_id: freezed == offer_id
          ? _value.offer_id
          : offer_id // ignore: cast_nullable_to_non_nullable
              as int?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      created_at: null == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentModelImplCopyWith<$Res>
    implements $PaymentModelCopyWith<$Res> {
  factory _$$PaymentModelImplCopyWith(
          _$PaymentModelImpl value, $Res Function(_$PaymentModelImpl) then) =
      __$$PaymentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String entity,
      double amount,
      double amount_paid,
      double amount_due,
      String currency,
      String receipt,
      int? offer_id,
      String status,
      int created_at});
}

/// @nodoc
class __$$PaymentModelImplCopyWithImpl<$Res>
    extends _$PaymentModelCopyWithImpl<$Res, _$PaymentModelImpl>
    implements _$$PaymentModelImplCopyWith<$Res> {
  __$$PaymentModelImplCopyWithImpl(
      _$PaymentModelImpl _value, $Res Function(_$PaymentModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? entity = null,
    Object? amount = null,
    Object? amount_paid = null,
    Object? amount_due = null,
    Object? currency = null,
    Object? receipt = null,
    Object? offer_id = freezed,
    Object? status = null,
    Object? created_at = null,
  }) {
    return _then(_$PaymentModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      entity: null == entity
          ? _value.entity
          : entity // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      amount_paid: null == amount_paid
          ? _value.amount_paid
          : amount_paid // ignore: cast_nullable_to_non_nullable
              as double,
      amount_due: null == amount_due
          ? _value.amount_due
          : amount_due // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      receipt: null == receipt
          ? _value.receipt
          : receipt // ignore: cast_nullable_to_non_nullable
              as String,
      offer_id: freezed == offer_id
          ? _value.offer_id
          : offer_id // ignore: cast_nullable_to_non_nullable
              as int?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      created_at: null == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentModelImpl implements _PaymentModel {
  _$PaymentModelImpl(
      {required this.id,
      required this.entity,
      required this.amount,
      required this.amount_paid,
      required this.amount_due,
      required this.currency,
      required this.receipt,
      this.offer_id,
      required this.status,
      required this.created_at});

  factory _$PaymentModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentModelImplFromJson(json);

  @override
  final String id;
  @override
  final String entity;
  @override
  final double amount;
  @override
  final double amount_paid;
  @override
  final double amount_due;
  @override
  final String currency;
  @override
  final String receipt;
  @override
  final int? offer_id;
  @override
  final String status;
  @override
  final int created_at;

  @override
  String toString() {
    return 'PaymentModel(id: $id, entity: $entity, amount: $amount, amount_paid: $amount_paid, amount_due: $amount_due, currency: $currency, receipt: $receipt, offer_id: $offer_id, status: $status, created_at: $created_at)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.entity, entity) || other.entity == entity) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.amount_paid, amount_paid) ||
                other.amount_paid == amount_paid) &&
            (identical(other.amount_due, amount_due) ||
                other.amount_due == amount_due) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.receipt, receipt) || other.receipt == receipt) &&
            (identical(other.offer_id, offer_id) ||
                other.offer_id == offer_id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.created_at, created_at) ||
                other.created_at == created_at));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, entity, amount, amount_paid,
      amount_due, currency, receipt, offer_id, status, created_at);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentModelImplCopyWith<_$PaymentModelImpl> get copyWith =>
      __$$PaymentModelImplCopyWithImpl<_$PaymentModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentModelImplToJson(
      this,
    );
  }
}

abstract class _PaymentModel implements PaymentModel {
  factory _PaymentModel(
      {required final String id,
      required final String entity,
      required final double amount,
      required final double amount_paid,
      required final double amount_due,
      required final String currency,
      required final String receipt,
      final int? offer_id,
      required final String status,
      required final int created_at}) = _$PaymentModelImpl;

  factory _PaymentModel.fromJson(Map<String, dynamic> json) =
      _$PaymentModelImpl.fromJson;

  @override
  String get id;
  @override
  String get entity;
  @override
  double get amount;
  @override
  double get amount_paid;
  @override
  double get amount_due;
  @override
  String get currency;
  @override
  String get receipt;
  @override
  int? get offer_id;
  @override
  String get status;
  @override
  int get created_at;
  @override
  @JsonKey(ignore: true)
  _$$PaymentModelImplCopyWith<_$PaymentModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
