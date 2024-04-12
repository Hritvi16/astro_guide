// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'RelationModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RelationModel _$RelationModelFromJson(Map<String, dynamic> json) {
  return _RelationModel.fromJson(json);
}

/// @nodoc
mixin _$RelationModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RelationModelCopyWith<RelationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RelationModelCopyWith<$Res> {
  factory $RelationModelCopyWith(
          RelationModel value, $Res Function(RelationModel) then) =
      _$RelationModelCopyWithImpl<$Res, RelationModel>;
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class _$RelationModelCopyWithImpl<$Res, $Val extends RelationModel>
    implements $RelationModelCopyWith<$Res> {
  _$RelationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RelationModelImplCopyWith<$Res>
    implements $RelationModelCopyWith<$Res> {
  factory _$$RelationModelImplCopyWith(
          _$RelationModelImpl value, $Res Function(_$RelationModelImpl) then) =
      __$$RelationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class __$$RelationModelImplCopyWithImpl<$Res>
    extends _$RelationModelCopyWithImpl<$Res, _$RelationModelImpl>
    implements _$$RelationModelImplCopyWith<$Res> {
  __$$RelationModelImplCopyWithImpl(
      _$RelationModelImpl _value, $Res Function(_$RelationModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$RelationModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RelationModelImpl implements _RelationModel {
  _$RelationModelImpl({required this.id, required this.name});

  factory _$RelationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RelationModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;

  @override
  String toString() {
    return 'RelationModel(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RelationModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RelationModelImplCopyWith<_$RelationModelImpl> get copyWith =>
      __$$RelationModelImplCopyWithImpl<_$RelationModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RelationModelImplToJson(
      this,
    );
  }
}

abstract class _RelationModel implements RelationModel {
  factory _RelationModel({required final int id, required final String name}) =
      _$RelationModelImpl;

  factory _RelationModel.fromJson(Map<String, dynamic> json) =
      _$RelationModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$RelationModelImplCopyWith<_$RelationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
