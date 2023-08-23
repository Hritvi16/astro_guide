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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
abstract class _$$_RelationModelCopyWith<$Res>
    implements $RelationModelCopyWith<$Res> {
  factory _$$_RelationModelCopyWith(
          _$_RelationModel value, $Res Function(_$_RelationModel) then) =
      __$$_RelationModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class __$$_RelationModelCopyWithImpl<$Res>
    extends _$RelationModelCopyWithImpl<$Res, _$_RelationModel>
    implements _$$_RelationModelCopyWith<$Res> {
  __$$_RelationModelCopyWithImpl(
      _$_RelationModel _value, $Res Function(_$_RelationModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$_RelationModel(
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
class _$_RelationModel implements _RelationModel {
  _$_RelationModel({required this.id, required this.name});

  factory _$_RelationModel.fromJson(Map<String, dynamic> json) =>
      _$$_RelationModelFromJson(json);

  @override
  final int id;
  @override
  final String name;

  @override
  String toString() {
    return 'RelationModel(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RelationModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RelationModelCopyWith<_$_RelationModel> get copyWith =>
      __$$_RelationModelCopyWithImpl<_$_RelationModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RelationModelToJson(
      this,
    );
  }
}

abstract class _RelationModel implements RelationModel {
  factory _RelationModel({required final int id, required final String name}) =
      _$_RelationModel;

  factory _RelationModel.fromJson(Map<String, dynamic> json) =
      _$_RelationModel.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_RelationModelCopyWith<_$_RelationModel> get copyWith =>
      throw _privateConstructorUsedError;
}
