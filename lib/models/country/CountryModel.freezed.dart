// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'CountryModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CountryModel _$CountryModelFromJson(Map<String, dynamic> json) {
  return _CountryModel.fromJson(json);
}

/// @nodoc
mixin _$CountryModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get nationality => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String get imageFullUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CountryModelCopyWith<CountryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountryModelCopyWith<$Res> {
  factory $CountryModelCopyWith(
          CountryModel value, $Res Function(CountryModel) then) =
      _$CountryModelCopyWithImpl<$Res, CountryModel>;
  @useResult
  $Res call(
      {int id,
      String name,
      String nationality,
      String icon,
      String code,
      String imageFullUrl});
}

/// @nodoc
class _$CountryModelCopyWithImpl<$Res, $Val extends CountryModel>
    implements $CountryModelCopyWith<$Res> {
  _$CountryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? nationality = null,
    Object? icon = null,
    Object? code = null,
    Object? imageFullUrl = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      nationality: null == nationality
          ? _value.nationality
          : nationality // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      imageFullUrl: null == imageFullUrl
          ? _value.imageFullUrl
          : imageFullUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CountryModelImplCopyWith<$Res>
    implements $CountryModelCopyWith<$Res> {
  factory _$$CountryModelImplCopyWith(
          _$CountryModelImpl value, $Res Function(_$CountryModelImpl) then) =
      __$$CountryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String nationality,
      String icon,
      String code,
      String imageFullUrl});
}

/// @nodoc
class __$$CountryModelImplCopyWithImpl<$Res>
    extends _$CountryModelCopyWithImpl<$Res, _$CountryModelImpl>
    implements _$$CountryModelImplCopyWith<$Res> {
  __$$CountryModelImplCopyWithImpl(
      _$CountryModelImpl _value, $Res Function(_$CountryModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? nationality = null,
    Object? icon = null,
    Object? code = null,
    Object? imageFullUrl = null,
  }) {
    return _then(_$CountryModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      nationality: null == nationality
          ? _value.nationality
          : nationality // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      imageFullUrl: null == imageFullUrl
          ? _value.imageFullUrl
          : imageFullUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CountryModelImpl implements _CountryModel {
  _$CountryModelImpl(
      {required this.id,
      required this.name,
      required this.nationality,
      required this.icon,
      required this.code,
      required this.imageFullUrl});

  factory _$CountryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CountryModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String nationality;
  @override
  final String icon;
  @override
  final String code;
  @override
  final String imageFullUrl;

  @override
  String toString() {
    return 'CountryModel(id: $id, name: $name, nationality: $nationality, icon: $icon, code: $code, imageFullUrl: $imageFullUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CountryModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.nationality, nationality) ||
                other.nationality == nationality) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.imageFullUrl, imageFullUrl) ||
                other.imageFullUrl == imageFullUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, nationality, icon, code, imageFullUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CountryModelImplCopyWith<_$CountryModelImpl> get copyWith =>
      __$$CountryModelImplCopyWithImpl<_$CountryModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CountryModelImplToJson(
      this,
    );
  }
}

abstract class _CountryModel implements CountryModel {
  factory _CountryModel(
      {required final int id,
      required final String name,
      required final String nationality,
      required final String icon,
      required final String code,
      required final String imageFullUrl}) = _$CountryModelImpl;

  factory _CountryModel.fromJson(Map<String, dynamic> json) =
      _$CountryModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get nationality;
  @override
  String get icon;
  @override
  String get code;
  @override
  String get imageFullUrl;
  @override
  @JsonKey(ignore: true)
  _$$CountryModelImplCopyWith<_$CountryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
