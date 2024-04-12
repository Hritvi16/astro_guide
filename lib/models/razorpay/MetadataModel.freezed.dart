// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'MetadataModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MetadataModel _$MetadataModelFromJson(Map<String, dynamic> json) {
  return _MetadataModel.fromJson(json);
}

/// @nodoc
mixin _$MetadataModel {
  String? get payment_id => throw _privateConstructorUsedError;
  String? get order_id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MetadataModelCopyWith<MetadataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetadataModelCopyWith<$Res> {
  factory $MetadataModelCopyWith(
          MetadataModel value, $Res Function(MetadataModel) then) =
      _$MetadataModelCopyWithImpl<$Res, MetadataModel>;
  @useResult
  $Res call({String? payment_id, String? order_id});
}

/// @nodoc
class _$MetadataModelCopyWithImpl<$Res, $Val extends MetadataModel>
    implements $MetadataModelCopyWith<$Res> {
  _$MetadataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? payment_id = freezed,
    Object? order_id = freezed,
  }) {
    return _then(_value.copyWith(
      payment_id: freezed == payment_id
          ? _value.payment_id
          : payment_id // ignore: cast_nullable_to_non_nullable
              as String?,
      order_id: freezed == order_id
          ? _value.order_id
          : order_id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MetadataModelImplCopyWith<$Res>
    implements $MetadataModelCopyWith<$Res> {
  factory _$$MetadataModelImplCopyWith(
          _$MetadataModelImpl value, $Res Function(_$MetadataModelImpl) then) =
      __$$MetadataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? payment_id, String? order_id});
}

/// @nodoc
class __$$MetadataModelImplCopyWithImpl<$Res>
    extends _$MetadataModelCopyWithImpl<$Res, _$MetadataModelImpl>
    implements _$$MetadataModelImplCopyWith<$Res> {
  __$$MetadataModelImplCopyWithImpl(
      _$MetadataModelImpl _value, $Res Function(_$MetadataModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? payment_id = freezed,
    Object? order_id = freezed,
  }) {
    return _then(_$MetadataModelImpl(
      payment_id: freezed == payment_id
          ? _value.payment_id
          : payment_id // ignore: cast_nullable_to_non_nullable
              as String?,
      order_id: freezed == order_id
          ? _value.order_id
          : order_id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MetadataModelImpl implements _MetadataModel {
  _$MetadataModelImpl({this.payment_id, this.order_id});

  factory _$MetadataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MetadataModelImplFromJson(json);

  @override
  final String? payment_id;
  @override
  final String? order_id;

  @override
  String toString() {
    return 'MetadataModel(payment_id: $payment_id, order_id: $order_id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MetadataModelImpl &&
            (identical(other.payment_id, payment_id) ||
                other.payment_id == payment_id) &&
            (identical(other.order_id, order_id) ||
                other.order_id == order_id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, payment_id, order_id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MetadataModelImplCopyWith<_$MetadataModelImpl> get copyWith =>
      __$$MetadataModelImplCopyWithImpl<_$MetadataModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MetadataModelImplToJson(
      this,
    );
  }
}

abstract class _MetadataModel implements MetadataModel {
  factory _MetadataModel({final String? payment_id, final String? order_id}) =
      _$MetadataModelImpl;

  factory _MetadataModel.fromJson(Map<String, dynamic> json) =
      _$MetadataModelImpl.fromJson;

  @override
  String? get payment_id;
  @override
  String? get order_id;
  @override
  @JsonKey(ignore: true)
  _$$MetadataModelImplCopyWith<_$MetadataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
