// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ValuesModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ValuesModel _$ValuesModelFromJson(Map<String, dynamic> json) {
  return _ValuesModel.fromJson(json);
}

/// @nodoc
mixin _$ValuesModel {
  String get status => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<CountryModel>? get countries => throw _privateConstructorUsedError;
  List<CityModel>? get cities => throw _privateConstructorUsedError;
  List<TypeModel>? get types => throw _privateConstructorUsedError;
  List<SpecModel>? get specifications => throw _privateConstructorUsedError;
  List<LanguageModel>? get languages => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ValuesModelCopyWith<ValuesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValuesModelCopyWith<$Res> {
  factory $ValuesModelCopyWith(
          ValuesModel value, $Res Function(ValuesModel) then) =
      _$ValuesModelCopyWithImpl<$Res, ValuesModel>;
  @useResult
  $Res call(
      {String status,
      int code,
      String message,
      List<CountryModel>? countries,
      List<CityModel>? cities,
      List<TypeModel>? types,
      List<SpecModel>? specifications,
      List<LanguageModel>? languages});
}

/// @nodoc
class _$ValuesModelCopyWithImpl<$Res, $Val extends ValuesModel>
    implements $ValuesModelCopyWith<$Res> {
  _$ValuesModelCopyWithImpl(this._value, this._then);

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
    Object? countries = freezed,
    Object? cities = freezed,
    Object? types = freezed,
    Object? specifications = freezed,
    Object? languages = freezed,
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
      countries: freezed == countries
          ? _value.countries
          : countries // ignore: cast_nullable_to_non_nullable
              as List<CountryModel>?,
      cities: freezed == cities
          ? _value.cities
          : cities // ignore: cast_nullable_to_non_nullable
              as List<CityModel>?,
      types: freezed == types
          ? _value.types
          : types // ignore: cast_nullable_to_non_nullable
              as List<TypeModel>?,
      specifications: freezed == specifications
          ? _value.specifications
          : specifications // ignore: cast_nullable_to_non_nullable
              as List<SpecModel>?,
      languages: freezed == languages
          ? _value.languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<LanguageModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ValuesModelCopyWith<$Res>
    implements $ValuesModelCopyWith<$Res> {
  factory _$$_ValuesModelCopyWith(
          _$_ValuesModel value, $Res Function(_$_ValuesModel) then) =
      __$$_ValuesModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String status,
      int code,
      String message,
      List<CountryModel>? countries,
      List<CityModel>? cities,
      List<TypeModel>? types,
      List<SpecModel>? specifications,
      List<LanguageModel>? languages});
}

/// @nodoc
class __$$_ValuesModelCopyWithImpl<$Res>
    extends _$ValuesModelCopyWithImpl<$Res, _$_ValuesModel>
    implements _$$_ValuesModelCopyWith<$Res> {
  __$$_ValuesModelCopyWithImpl(
      _$_ValuesModel _value, $Res Function(_$_ValuesModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = null,
    Object? message = null,
    Object? countries = freezed,
    Object? cities = freezed,
    Object? types = freezed,
    Object? specifications = freezed,
    Object? languages = freezed,
  }) {
    return _then(_$_ValuesModel(
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
      countries: freezed == countries
          ? _value._countries
          : countries // ignore: cast_nullable_to_non_nullable
              as List<CountryModel>?,
      cities: freezed == cities
          ? _value._cities
          : cities // ignore: cast_nullable_to_non_nullable
              as List<CityModel>?,
      types: freezed == types
          ? _value._types
          : types // ignore: cast_nullable_to_non_nullable
              as List<TypeModel>?,
      specifications: freezed == specifications
          ? _value._specifications
          : specifications // ignore: cast_nullable_to_non_nullable
              as List<SpecModel>?,
      languages: freezed == languages
          ? _value._languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<LanguageModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ValuesModel implements _ValuesModel {
  _$_ValuesModel(
      {required this.status,
      required this.code,
      required this.message,
      final List<CountryModel>? countries,
      final List<CityModel>? cities,
      final List<TypeModel>? types,
      final List<SpecModel>? specifications,
      final List<LanguageModel>? languages})
      : _countries = countries,
        _cities = cities,
        _types = types,
        _specifications = specifications,
        _languages = languages;

  factory _$_ValuesModel.fromJson(Map<String, dynamic> json) =>
      _$$_ValuesModelFromJson(json);

  @override
  final String status;
  @override
  final int code;
  @override
  final String message;
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

  final List<TypeModel>? _types;
  @override
  List<TypeModel>? get types {
    final value = _types;
    if (value == null) return null;
    if (_types is EqualUnmodifiableListView) return _types;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<SpecModel>? _specifications;
  @override
  List<SpecModel>? get specifications {
    final value = _specifications;
    if (value == null) return null;
    if (_specifications is EqualUnmodifiableListView) return _specifications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<LanguageModel>? _languages;
  @override
  List<LanguageModel>? get languages {
    final value = _languages;
    if (value == null) return null;
    if (_languages is EqualUnmodifiableListView) return _languages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ValuesModel(status: $status, code: $code, message: $message, countries: $countries, cities: $cities, types: $types, specifications: $specifications, languages: $languages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ValuesModel &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other._countries, _countries) &&
            const DeepCollectionEquality().equals(other._cities, _cities) &&
            const DeepCollectionEquality().equals(other._types, _types) &&
            const DeepCollectionEquality()
                .equals(other._specifications, _specifications) &&
            const DeepCollectionEquality()
                .equals(other._languages, _languages));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      code,
      message,
      const DeepCollectionEquality().hash(_countries),
      const DeepCollectionEquality().hash(_cities),
      const DeepCollectionEquality().hash(_types),
      const DeepCollectionEquality().hash(_specifications),
      const DeepCollectionEquality().hash(_languages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ValuesModelCopyWith<_$_ValuesModel> get copyWith =>
      __$$_ValuesModelCopyWithImpl<_$_ValuesModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ValuesModelToJson(
      this,
    );
  }
}

abstract class _ValuesModel implements ValuesModel {
  factory _ValuesModel(
      {required final String status,
      required final int code,
      required final String message,
      final List<CountryModel>? countries,
      final List<CityModel>? cities,
      final List<TypeModel>? types,
      final List<SpecModel>? specifications,
      final List<LanguageModel>? languages}) = _$_ValuesModel;

  factory _ValuesModel.fromJson(Map<String, dynamic> json) =
      _$_ValuesModel.fromJson;

  @override
  String get status;
  @override
  int get code;
  @override
  String get message;
  @override
  List<CountryModel>? get countries;
  @override
  List<CityModel>? get cities;
  @override
  List<TypeModel>? get types;
  @override
  List<SpecModel>? get specifications;
  @override
  List<LanguageModel>? get languages;
  @override
  @JsonKey(ignore: true)
  _$$_ValuesModelCopyWith<_$_ValuesModel> get copyWith =>
      throw _privateConstructorUsedError;
}
