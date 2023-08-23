// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'StateModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StateModel _$StateModelFromJson(Map<String, dynamic> json) {
  return _StateModel.fromJson(json);
}

/// @nodoc
mixin _$StateModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get co_id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StateModelCopyWith<StateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StateModelCopyWith<$Res> {
  factory $StateModelCopyWith(
          StateModel value, $Res Function(StateModel) then) =
      _$StateModelCopyWithImpl<$Res, StateModel>;
  @useResult
  $Res call({int id, String name, int co_id});
}

/// @nodoc
class _$StateModelCopyWithImpl<$Res, $Val extends StateModel>
    implements $StateModelCopyWith<$Res> {
  _$StateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? co_id = null,
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
      co_id: null == co_id
          ? _value.co_id
          : co_id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StateModelCopyWith<$Res>
    implements $StateModelCopyWith<$Res> {
  factory _$$_StateModelCopyWith(
          _$_StateModel value, $Res Function(_$_StateModel) then) =
      __$$_StateModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, int co_id});
}

/// @nodoc
class __$$_StateModelCopyWithImpl<$Res>
    extends _$StateModelCopyWithImpl<$Res, _$_StateModel>
    implements _$$_StateModelCopyWith<$Res> {
  __$$_StateModelCopyWithImpl(
      _$_StateModel _value, $Res Function(_$_StateModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? co_id = null,
  }) {
    return _then(_$_StateModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      co_id: null == co_id
          ? _value.co_id
          : co_id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StateModel implements _StateModel {
  _$_StateModel({required this.id, required this.name, required this.co_id});

  factory _$_StateModel.fromJson(Map<String, dynamic> json) =>
      _$$_StateModelFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final int co_id;

  @override
  String toString() {
    return 'StateModel(id: $id, name: $name, co_id: $co_id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StateModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.co_id, co_id) || other.co_id == co_id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, co_id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StateModelCopyWith<_$_StateModel> get copyWith =>
      __$$_StateModelCopyWithImpl<_$_StateModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StateModelToJson(
      this,
    );
  }
}

abstract class _StateModel implements StateModel {
  factory _StateModel(
      {required final int id,
      required final String name,
      required final int co_id}) = _$_StateModel;

  factory _StateModel.fromJson(Map<String, dynamic> json) =
      _$_StateModel.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  int get co_id;
  @override
  @JsonKey(ignore: true)
  _$$_StateModelCopyWith<_$_StateModel> get copyWith =>
      throw _privateConstructorUsedError;
}
