// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'HoroscopeResponseModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HoroscopeResponseModel _$HoroscopeResponseModelFromJson(
    Map<String, dynamic> json) {
  return _HoroscopeResponseModel.fromJson(json);
}

/// @nodoc
mixin _$HoroscopeResponseModel {
  String get status => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  HoroscopeTimeModel? get daily => throw _privateConstructorUsedError;
  HoroscopeTimeModel? get weekly => throw _privateConstructorUsedError;
  HoroscopeTimeModel? get monthly => throw _privateConstructorUsedError;
  HoroscopeTimeModel? get yearly => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HoroscopeResponseModelCopyWith<HoroscopeResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HoroscopeResponseModelCopyWith<$Res> {
  factory $HoroscopeResponseModelCopyWith(HoroscopeResponseModel value,
          $Res Function(HoroscopeResponseModel) then) =
      _$HoroscopeResponseModelCopyWithImpl<$Res, HoroscopeResponseModel>;
  @useResult
  $Res call(
      {String status,
      int code,
      String message,
      HoroscopeTimeModel? daily,
      HoroscopeTimeModel? weekly,
      HoroscopeTimeModel? monthly,
      HoroscopeTimeModel? yearly});

  $HoroscopeTimeModelCopyWith<$Res>? get daily;
  $HoroscopeTimeModelCopyWith<$Res>? get weekly;
  $HoroscopeTimeModelCopyWith<$Res>? get monthly;
  $HoroscopeTimeModelCopyWith<$Res>? get yearly;
}

/// @nodoc
class _$HoroscopeResponseModelCopyWithImpl<$Res,
        $Val extends HoroscopeResponseModel>
    implements $HoroscopeResponseModelCopyWith<$Res> {
  _$HoroscopeResponseModelCopyWithImpl(this._value, this._then);

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
    Object? daily = freezed,
    Object? weekly = freezed,
    Object? monthly = freezed,
    Object? yearly = freezed,
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
      daily: freezed == daily
          ? _value.daily
          : daily // ignore: cast_nullable_to_non_nullable
              as HoroscopeTimeModel?,
      weekly: freezed == weekly
          ? _value.weekly
          : weekly // ignore: cast_nullable_to_non_nullable
              as HoroscopeTimeModel?,
      monthly: freezed == monthly
          ? _value.monthly
          : monthly // ignore: cast_nullable_to_non_nullable
              as HoroscopeTimeModel?,
      yearly: freezed == yearly
          ? _value.yearly
          : yearly // ignore: cast_nullable_to_non_nullable
              as HoroscopeTimeModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $HoroscopeTimeModelCopyWith<$Res>? get daily {
    if (_value.daily == null) {
      return null;
    }

    return $HoroscopeTimeModelCopyWith<$Res>(_value.daily!, (value) {
      return _then(_value.copyWith(daily: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $HoroscopeTimeModelCopyWith<$Res>? get weekly {
    if (_value.weekly == null) {
      return null;
    }

    return $HoroscopeTimeModelCopyWith<$Res>(_value.weekly!, (value) {
      return _then(_value.copyWith(weekly: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $HoroscopeTimeModelCopyWith<$Res>? get monthly {
    if (_value.monthly == null) {
      return null;
    }

    return $HoroscopeTimeModelCopyWith<$Res>(_value.monthly!, (value) {
      return _then(_value.copyWith(monthly: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $HoroscopeTimeModelCopyWith<$Res>? get yearly {
    if (_value.yearly == null) {
      return null;
    }

    return $HoroscopeTimeModelCopyWith<$Res>(_value.yearly!, (value) {
      return _then(_value.copyWith(yearly: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HoroscopeResponseModelImplCopyWith<$Res>
    implements $HoroscopeResponseModelCopyWith<$Res> {
  factory _$$HoroscopeResponseModelImplCopyWith(
          _$HoroscopeResponseModelImpl value,
          $Res Function(_$HoroscopeResponseModelImpl) then) =
      __$$HoroscopeResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String status,
      int code,
      String message,
      HoroscopeTimeModel? daily,
      HoroscopeTimeModel? weekly,
      HoroscopeTimeModel? monthly,
      HoroscopeTimeModel? yearly});

  @override
  $HoroscopeTimeModelCopyWith<$Res>? get daily;
  @override
  $HoroscopeTimeModelCopyWith<$Res>? get weekly;
  @override
  $HoroscopeTimeModelCopyWith<$Res>? get monthly;
  @override
  $HoroscopeTimeModelCopyWith<$Res>? get yearly;
}

/// @nodoc
class __$$HoroscopeResponseModelImplCopyWithImpl<$Res>
    extends _$HoroscopeResponseModelCopyWithImpl<$Res,
        _$HoroscopeResponseModelImpl>
    implements _$$HoroscopeResponseModelImplCopyWith<$Res> {
  __$$HoroscopeResponseModelImplCopyWithImpl(
      _$HoroscopeResponseModelImpl _value,
      $Res Function(_$HoroscopeResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = null,
    Object? message = null,
    Object? daily = freezed,
    Object? weekly = freezed,
    Object? monthly = freezed,
    Object? yearly = freezed,
  }) {
    return _then(_$HoroscopeResponseModelImpl(
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
      daily: freezed == daily
          ? _value.daily
          : daily // ignore: cast_nullable_to_non_nullable
              as HoroscopeTimeModel?,
      weekly: freezed == weekly
          ? _value.weekly
          : weekly // ignore: cast_nullable_to_non_nullable
              as HoroscopeTimeModel?,
      monthly: freezed == monthly
          ? _value.monthly
          : monthly // ignore: cast_nullable_to_non_nullable
              as HoroscopeTimeModel?,
      yearly: freezed == yearly
          ? _value.yearly
          : yearly // ignore: cast_nullable_to_non_nullable
              as HoroscopeTimeModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HoroscopeResponseModelImpl implements _HoroscopeResponseModel {
  _$HoroscopeResponseModelImpl(
      {required this.status,
      required this.code,
      required this.message,
      this.daily,
      this.weekly,
      this.monthly,
      this.yearly});

  factory _$HoroscopeResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HoroscopeResponseModelImplFromJson(json);

  @override
  final String status;
  @override
  final int code;
  @override
  final String message;
  @override
  final HoroscopeTimeModel? daily;
  @override
  final HoroscopeTimeModel? weekly;
  @override
  final HoroscopeTimeModel? monthly;
  @override
  final HoroscopeTimeModel? yearly;

  @override
  String toString() {
    return 'HoroscopeResponseModel(status: $status, code: $code, message: $message, daily: $daily, weekly: $weekly, monthly: $monthly, yearly: $yearly)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HoroscopeResponseModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.daily, daily) || other.daily == daily) &&
            (identical(other.weekly, weekly) || other.weekly == weekly) &&
            (identical(other.monthly, monthly) || other.monthly == monthly) &&
            (identical(other.yearly, yearly) || other.yearly == yearly));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, code, message, daily, weekly, monthly, yearly);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HoroscopeResponseModelImplCopyWith<_$HoroscopeResponseModelImpl>
      get copyWith => __$$HoroscopeResponseModelImplCopyWithImpl<
          _$HoroscopeResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HoroscopeResponseModelImplToJson(
      this,
    );
  }
}

abstract class _HoroscopeResponseModel implements HoroscopeResponseModel {
  factory _HoroscopeResponseModel(
      {required final String status,
      required final int code,
      required final String message,
      final HoroscopeTimeModel? daily,
      final HoroscopeTimeModel? weekly,
      final HoroscopeTimeModel? monthly,
      final HoroscopeTimeModel? yearly}) = _$HoroscopeResponseModelImpl;

  factory _HoroscopeResponseModel.fromJson(Map<String, dynamic> json) =
      _$HoroscopeResponseModelImpl.fromJson;

  @override
  String get status;
  @override
  int get code;
  @override
  String get message;
  @override
  HoroscopeTimeModel? get daily;
  @override
  HoroscopeTimeModel? get weekly;
  @override
  HoroscopeTimeModel? get monthly;
  @override
  HoroscopeTimeModel? get yearly;
  @override
  @JsonKey(ignore: true)
  _$$HoroscopeResponseModelImplCopyWith<_$HoroscopeResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
