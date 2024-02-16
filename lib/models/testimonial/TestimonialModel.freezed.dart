// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'TestimonialModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TestimonialModel _$TestimonialModelFromJson(Map<String, dynamic> json) {
  return _TestimonialModel.fromJson(json);
}

/// @nodoc
mixin _$TestimonialModel {
  int get id => throw _privateConstructorUsedError;
  int get user_id => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get created_at => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get profile => throw _privateConstructorUsedError;
  String get state => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TestimonialModelCopyWith<TestimonialModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TestimonialModelCopyWith<$Res> {
  factory $TestimonialModelCopyWith(
          TestimonialModel value, $Res Function(TestimonialModel) then) =
      _$TestimonialModelCopyWithImpl<$Res, TestimonialModel>;
  @useResult
  $Res call(
      {int id,
      int user_id,
      String description,
      String created_at,
      String name,
      String? profile,
      String state,
      String country});
}

/// @nodoc
class _$TestimonialModelCopyWithImpl<$Res, $Val extends TestimonialModel>
    implements $TestimonialModelCopyWith<$Res> {
  _$TestimonialModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user_id = null,
    Object? description = null,
    Object? created_at = null,
    Object? name = null,
    Object? profile = freezed,
    Object? state = null,
    Object? country = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      user_id: null == user_id
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      created_at: null == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      profile: freezed == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as String?,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TestimonialModelImplCopyWith<$Res>
    implements $TestimonialModelCopyWith<$Res> {
  factory _$$TestimonialModelImplCopyWith(_$TestimonialModelImpl value,
          $Res Function(_$TestimonialModelImpl) then) =
      __$$TestimonialModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int user_id,
      String description,
      String created_at,
      String name,
      String? profile,
      String state,
      String country});
}

/// @nodoc
class __$$TestimonialModelImplCopyWithImpl<$Res>
    extends _$TestimonialModelCopyWithImpl<$Res, _$TestimonialModelImpl>
    implements _$$TestimonialModelImplCopyWith<$Res> {
  __$$TestimonialModelImplCopyWithImpl(_$TestimonialModelImpl _value,
      $Res Function(_$TestimonialModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? user_id = null,
    Object? description = null,
    Object? created_at = null,
    Object? name = null,
    Object? profile = freezed,
    Object? state = null,
    Object? country = null,
  }) {
    return _then(_$TestimonialModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      user_id: null == user_id
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      created_at: null == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      profile: freezed == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as String?,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TestimonialModelImpl implements _TestimonialModel {
  _$TestimonialModelImpl(
      {required this.id,
      required this.user_id,
      required this.description,
      required this.created_at,
      required this.name,
      this.profile,
      required this.state,
      required this.country});

  factory _$TestimonialModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TestimonialModelImplFromJson(json);

  @override
  final int id;
  @override
  final int user_id;
  @override
  final String description;
  @override
  final String created_at;
  @override
  final String name;
  @override
  final String? profile;
  @override
  final String state;
  @override
  final String country;

  @override
  String toString() {
    return 'TestimonialModel(id: $id, user_id: $user_id, description: $description, created_at: $created_at, name: $name, profile: $profile, state: $state, country: $country)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TestimonialModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user_id, user_id) || other.user_id == user_id) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.created_at, created_at) ||
                other.created_at == created_at) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.country, country) || other.country == country));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, user_id, description,
      created_at, name, profile, state, country);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TestimonialModelImplCopyWith<_$TestimonialModelImpl> get copyWith =>
      __$$TestimonialModelImplCopyWithImpl<_$TestimonialModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TestimonialModelImplToJson(
      this,
    );
  }
}

abstract class _TestimonialModel implements TestimonialModel {
  factory _TestimonialModel(
      {required final int id,
      required final int user_id,
      required final String description,
      required final String created_at,
      required final String name,
      final String? profile,
      required final String state,
      required final String country}) = _$TestimonialModelImpl;

  factory _TestimonialModel.fromJson(Map<String, dynamic> json) =
      _$TestimonialModelImpl.fromJson;

  @override
  int get id;
  @override
  int get user_id;
  @override
  String get description;
  @override
  String get created_at;
  @override
  String get name;
  @override
  String? get profile;
  @override
  String get state;
  @override
  String get country;
  @override
  @JsonKey(ignore: true)
  _$$TestimonialModelImplCopyWith<_$TestimonialModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
