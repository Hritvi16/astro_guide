// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'MyProfileResponseModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MyProfileResponseModel _$MyProfileResponseModelFromJson(
    Map<String, dynamic> json) {
  return _MyProfileResponseModel.fromJson(json);
}

/// @nodoc
mixin _$MyProfileResponseModel {
  String get status => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  UserModel? get data => throw _privateConstructorUsedError;
  List<CountryModel>? get countries => throw _privateConstructorUsedError;
  List<CityModel>? get cities => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MyProfileResponseModelCopyWith<MyProfileResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyProfileResponseModelCopyWith<$Res> {
  factory $MyProfileResponseModelCopyWith(MyProfileResponseModel value,
          $Res Function(MyProfileResponseModel) then) =
      _$MyProfileResponseModelCopyWithImpl<$Res, MyProfileResponseModel>;
  @useResult
  $Res call(
      {String status,
      int code,
      String message,
      UserModel? data,
      List<CountryModel>? countries,
      List<CityModel>? cities});

  $UserModelCopyWith<$Res>? get data;
}

/// @nodoc
class _$MyProfileResponseModelCopyWithImpl<$Res,
        $Val extends MyProfileResponseModel>
    implements $MyProfileResponseModelCopyWith<$Res> {
  _$MyProfileResponseModelCopyWithImpl(this._value, this._then);

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
    Object? data = freezed,
    Object? countries = freezed,
    Object? cities = freezed,
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
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      countries: freezed == countries
          ? _value.countries
          : countries // ignore: cast_nullable_to_non_nullable
              as List<CountryModel>?,
      cities: freezed == cities
          ? _value.cities
          : cities // ignore: cast_nullable_to_non_nullable
              as List<CityModel>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MyProfileResponseModelImplCopyWith<$Res>
    implements $MyProfileResponseModelCopyWith<$Res> {
  factory _$$MyProfileResponseModelImplCopyWith(
          _$MyProfileResponseModelImpl value,
          $Res Function(_$MyProfileResponseModelImpl) then) =
      __$$MyProfileResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String status,
      int code,
      String message,
      UserModel? data,
      List<CountryModel>? countries,
      List<CityModel>? cities});

  @override
  $UserModelCopyWith<$Res>? get data;
}

/// @nodoc
class __$$MyProfileResponseModelImplCopyWithImpl<$Res>
    extends _$MyProfileResponseModelCopyWithImpl<$Res,
        _$MyProfileResponseModelImpl>
    implements _$$MyProfileResponseModelImplCopyWith<$Res> {
  __$$MyProfileResponseModelImplCopyWithImpl(
      _$MyProfileResponseModelImpl _value,
      $Res Function(_$MyProfileResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = null,
    Object? message = null,
    Object? data = freezed,
    Object? countries = freezed,
    Object? cities = freezed,
  }) {
    return _then(_$MyProfileResponseModelImpl(
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
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      countries: freezed == countries
          ? _value._countries
          : countries // ignore: cast_nullable_to_non_nullable
              as List<CountryModel>?,
      cities: freezed == cities
          ? _value._cities
          : cities // ignore: cast_nullable_to_non_nullable
              as List<CityModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MyProfileResponseModelImpl implements _MyProfileResponseModel {
  _$MyProfileResponseModelImpl(
      {required this.status,
      required this.code,
      required this.message,
      this.data,
      final List<CountryModel>? countries,
      final List<CityModel>? cities})
      : _countries = countries,
        _cities = cities;

  factory _$MyProfileResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MyProfileResponseModelImplFromJson(json);

  @override
  final String status;
  @override
  final int code;
  @override
  final String message;
  @override
  final UserModel? data;
  final List<CountryModel>? _countries;
  @override
  List<CountryModel>? get countries {
    final value = _countries;
    if (value == null) return null;
    if (_countries is EqualUnmodifiableListView) return _countries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<CityModel>? _cities;
  @override
  List<CityModel>? get cities {
    final value = _cities;
    if (value == null) return null;
    if (_cities is EqualUnmodifiableListView) return _cities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'MyProfileResponseModel(status: $status, code: $code, message: $message, data: $data, countries: $countries, cities: $cities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyProfileResponseModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data) &&
            const DeepCollectionEquality()
                .equals(other._countries, _countries) &&
            const DeepCollectionEquality().equals(other._cities, _cities));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      code,
      message,
      data,
      const DeepCollectionEquality().hash(_countries),
      const DeepCollectionEquality().hash(_cities));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MyProfileResponseModelImplCopyWith<_$MyProfileResponseModelImpl>
      get copyWith => __$$MyProfileResponseModelImplCopyWithImpl<
          _$MyProfileResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MyProfileResponseModelImplToJson(
      this,
    );
  }
}

abstract class _MyProfileResponseModel implements MyProfileResponseModel {
  factory _MyProfileResponseModel(
      {required final String status,
      required final int code,
      required final String message,
      final UserModel? data,
      final List<CountryModel>? countries,
      final List<CityModel>? cities}) = _$MyProfileResponseModelImpl;

  factory _MyProfileResponseModel.fromJson(Map<String, dynamic> json) =
      _$MyProfileResponseModelImpl.fromJson;

  @override
  String get status;
  @override
  int get code;
  @override
  String get message;
  @override
  UserModel? get data;
  @override
  List<CountryModel>? get countries;
  @override
  List<CityModel>? get cities;
  @override
  @JsonKey(ignore: true)
  _$$MyProfileResponseModelImplCopyWith<_$MyProfileResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
