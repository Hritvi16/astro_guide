// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'WalletHistoryModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WalletHistoryModel _$WalletHistoryModelFromJson(Map<String, dynamic> json) {
  return _WalletHistoryModel.fromJson(json);
}

/// @nodoc
mixin _$WalletHistoryModel {
  int get id => throw _privateConstructorUsedError;
  int? get user_id => throw _privateConstructorUsedError;
  int? get astro_id => throw _privateConstructorUsedError;
  String? get order_id => throw _privateConstructorUsedError;
  String? get invoice_id => throw _privateConstructorUsedError;
  String? get transaction_id => throw _privateConstructorUsedError;
  int? get p_id => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  double get wallet_amount => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get t_type => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get created_at => throw _privateConstructorUsedError;
  String? get updated_at => throw _privateConstructorUsedError;
  int get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WalletHistoryModelCopyWith<WalletHistoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletHistoryModelCopyWith<$Res> {
  factory $WalletHistoryModelCopyWith(
          WalletHistoryModel value, $Res Function(WalletHistoryModel) then) =
      _$WalletHistoryModelCopyWithImpl<$Res, WalletHistoryModel>;
  @useResult
  $Res call(
      {int id,
      int? user_id,
      int? astro_id,
      String? order_id,
      String? invoice_id,
      String? transaction_id,
      int? p_id,
      double amount,
      double wallet_amount,
      String type,
      String t_type,
      String description,
      String created_at,
      String? updated_at,
      int status});
}

/// @nodoc
class _$WalletHistoryModelCopyWithImpl<$Res, $Val extends WalletHistoryModel>
    implements $WalletHistoryModelCopyWith<$Res> {
  _$WalletHistoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user_id = freezed,
    Object? astro_id = freezed,
    Object? order_id = freezed,
    Object? invoice_id = freezed,
    Object? transaction_id = freezed,
    Object? p_id = freezed,
    Object? amount = null,
    Object? wallet_amount = null,
    Object? type = null,
    Object? t_type = null,
    Object? description = null,
    Object? created_at = null,
    Object? updated_at = freezed,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      user_id: freezed == user_id
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as int?,
      astro_id: freezed == astro_id
          ? _value.astro_id
          : astro_id // ignore: cast_nullable_to_non_nullable
              as int?,
      order_id: freezed == order_id
          ? _value.order_id
          : order_id // ignore: cast_nullable_to_non_nullable
              as String?,
      invoice_id: freezed == invoice_id
          ? _value.invoice_id
          : invoice_id // ignore: cast_nullable_to_non_nullable
              as String?,
      transaction_id: freezed == transaction_id
          ? _value.transaction_id
          : transaction_id // ignore: cast_nullable_to_non_nullable
              as String?,
      p_id: freezed == p_id
          ? _value.p_id
          : p_id // ignore: cast_nullable_to_non_nullable
              as int?,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      wallet_amount: null == wallet_amount
          ? _value.wallet_amount
          : wallet_amount // ignore: cast_nullable_to_non_nullable
              as double,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      t_type: null == t_type
          ? _value.t_type
          : t_type // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      created_at: null == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String,
      updated_at: freezed == updated_at
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WalletHistoryModelImplCopyWith<$Res>
    implements $WalletHistoryModelCopyWith<$Res> {
  factory _$$WalletHistoryModelImplCopyWith(_$WalletHistoryModelImpl value,
          $Res Function(_$WalletHistoryModelImpl) then) =
      __$$WalletHistoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int? user_id,
      int? astro_id,
      String? order_id,
      String? invoice_id,
      String? transaction_id,
      int? p_id,
      double amount,
      double wallet_amount,
      String type,
      String t_type,
      String description,
      String created_at,
      String? updated_at,
      int status});
}

/// @nodoc
class __$$WalletHistoryModelImplCopyWithImpl<$Res>
    extends _$WalletHistoryModelCopyWithImpl<$Res, _$WalletHistoryModelImpl>
    implements _$$WalletHistoryModelImplCopyWith<$Res> {
  __$$WalletHistoryModelImplCopyWithImpl(_$WalletHistoryModelImpl _value,
      $Res Function(_$WalletHistoryModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user_id = freezed,
    Object? astro_id = freezed,
    Object? order_id = freezed,
    Object? invoice_id = freezed,
    Object? transaction_id = freezed,
    Object? p_id = freezed,
    Object? amount = null,
    Object? wallet_amount = null,
    Object? type = null,
    Object? t_type = null,
    Object? description = null,
    Object? created_at = null,
    Object? updated_at = freezed,
    Object? status = null,
  }) {
    return _then(_$WalletHistoryModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      user_id: freezed == user_id
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as int?,
      astro_id: freezed == astro_id
          ? _value.astro_id
          : astro_id // ignore: cast_nullable_to_non_nullable
              as int?,
      order_id: freezed == order_id
          ? _value.order_id
          : order_id // ignore: cast_nullable_to_non_nullable
              as String?,
      invoice_id: freezed == invoice_id
          ? _value.invoice_id
          : invoice_id // ignore: cast_nullable_to_non_nullable
              as String?,
      transaction_id: freezed == transaction_id
          ? _value.transaction_id
          : transaction_id // ignore: cast_nullable_to_non_nullable
              as String?,
      p_id: freezed == p_id
          ? _value.p_id
          : p_id // ignore: cast_nullable_to_non_nullable
              as int?,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      wallet_amount: null == wallet_amount
          ? _value.wallet_amount
          : wallet_amount // ignore: cast_nullable_to_non_nullable
              as double,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      t_type: null == t_type
          ? _value.t_type
          : t_type // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      created_at: null == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String,
      updated_at: freezed == updated_at
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WalletHistoryModelImpl implements _WalletHistoryModel {
  _$WalletHistoryModelImpl(
      {required this.id,
      this.user_id,
      this.astro_id,
      this.order_id,
      this.invoice_id,
      this.transaction_id,
      this.p_id,
      required this.amount,
      required this.wallet_amount,
      required this.type,
      required this.t_type,
      required this.description,
      required this.created_at,
      this.updated_at,
      required this.status});

  factory _$WalletHistoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WalletHistoryModelImplFromJson(json);

  @override
  final int id;
  @override
  final int? user_id;
  @override
  final int? astro_id;
  @override
  final String? order_id;
  @override
  final String? invoice_id;
  @override
  final String? transaction_id;
  @override
  final int? p_id;
  @override
  final double amount;
  @override
  final double wallet_amount;
  @override
  final String type;
  @override
  final String t_type;
  @override
  final String description;
  @override
  final String created_at;
  @override
  final String? updated_at;
  @override
  final int status;

  @override
  String toString() {
    return 'WalletHistoryModel(id: $id, user_id: $user_id, astro_id: $astro_id, order_id: $order_id, invoice_id: $invoice_id, transaction_id: $transaction_id, p_id: $p_id, amount: $amount, wallet_amount: $wallet_amount, type: $type, t_type: $t_type, description: $description, created_at: $created_at, updated_at: $updated_at, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletHistoryModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user_id, user_id) || other.user_id == user_id) &&
            (identical(other.astro_id, astro_id) ||
                other.astro_id == astro_id) &&
            (identical(other.order_id, order_id) ||
                other.order_id == order_id) &&
            (identical(other.invoice_id, invoice_id) ||
                other.invoice_id == invoice_id) &&
            (identical(other.transaction_id, transaction_id) ||
                other.transaction_id == transaction_id) &&
            (identical(other.p_id, p_id) || other.p_id == p_id) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.wallet_amount, wallet_amount) ||
                other.wallet_amount == wallet_amount) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.t_type, t_type) || other.t_type == t_type) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.created_at, created_at) ||
                other.created_at == created_at) &&
            (identical(other.updated_at, updated_at) ||
                other.updated_at == updated_at) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      user_id,
      astro_id,
      order_id,
      invoice_id,
      transaction_id,
      p_id,
      amount,
      wallet_amount,
      type,
      t_type,
      description,
      created_at,
      updated_at,
      status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletHistoryModelImplCopyWith<_$WalletHistoryModelImpl> get copyWith =>
      __$$WalletHistoryModelImplCopyWithImpl<_$WalletHistoryModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WalletHistoryModelImplToJson(
      this,
    );
  }
}

abstract class _WalletHistoryModel implements WalletHistoryModel {
  factory _WalletHistoryModel(
      {required final int id,
      final int? user_id,
      final int? astro_id,
      final String? order_id,
      final String? invoice_id,
      final String? transaction_id,
      final int? p_id,
      required final double amount,
      required final double wallet_amount,
      required final String type,
      required final String t_type,
      required final String description,
      required final String created_at,
      final String? updated_at,
      required final int status}) = _$WalletHistoryModelImpl;

  factory _WalletHistoryModel.fromJson(Map<String, dynamic> json) =
      _$WalletHistoryModelImpl.fromJson;

  @override
  int get id;
  @override
  int? get user_id;
  @override
  int? get astro_id;
  @override
  String? get order_id;
  @override
  String? get invoice_id;
  @override
  String? get transaction_id;
  @override
  int? get p_id;
  @override
  double get amount;
  @override
  double get wallet_amount;
  @override
  String get type;
  @override
  String get t_type;
  @override
  String get description;
  @override
  String get created_at;
  @override
  String? get updated_at;
  @override
  int get status;
  @override
  @JsonKey(ignore: true)
  _$$WalletHistoryModelImplCopyWith<_$WalletHistoryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
