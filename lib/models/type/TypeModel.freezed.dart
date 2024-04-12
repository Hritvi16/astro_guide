// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'TypeModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TypeModel _$TypeModelFromJson(Map<String, dynamic> json) {
  return _TypeModel.fromJson(json);
}

/// @nodoc
mixin _$TypeModel {
  int get id => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TypeModelCopyWith<TypeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TypeModelCopyWith<$Res> {
  factory $TypeModelCopyWith(TypeModel value, $Res Function(TypeModel) then) =
      _$TypeModelCopyWithImpl<$Res, TypeModel>;
  @useResult
  $Res call({int id, String type});
}

/// @nodoc
class _$TypeModelCopyWithImpl<$Res, $Val extends TypeModel>
    implements $TypeModelCopyWith<$Res> {
  _$TypeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TypeModelImplCopyWith<$Res>
    implements $TypeModelCopyWith<$Res> {
  factory _$$TypeModelImplCopyWith(
          _$TypeModelImpl value, $Res Function(_$TypeModelImpl) then) =
      __$$TypeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String type});
}

/// @nodoc
class __$$TypeModelImplCopyWithImpl<$Res>
    extends _$TypeModelCopyWithImpl<$Res, _$TypeModelImpl>
    implements _$$TypeModelImplCopyWith<$Res> {
  __$$TypeModelImplCopyWithImpl(
      _$TypeModelImpl _value, $Res Function(_$TypeModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
  }) {
    return _then(_$TypeModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TypeModelImpl implements _TypeModel {
  _$TypeModelImpl({required this.id, required this.type});

  factory _$TypeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TypeModelImplFromJson(json);

  @override
  final int id;
  @override
  final String type;

  @override
  String toString() {
    return 'TypeModel(id: $id, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TypeModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TypeModelImplCopyWith<_$TypeModelImpl> get copyWith =>
      __$$TypeModelImplCopyWithImpl<_$TypeModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TypeModelImplToJson(
      this,
    );
  }
}

abstract class _TypeModel implements TypeModel {
  factory _TypeModel({required final int id, required final String type}) =
      _$TypeModelImpl;

  factory _TypeModel.fromJson(Map<String, dynamic> json) =
      _$TypeModelImpl.fromJson;

  @override
  int get id;
  @override
  String get type;
  @override
  @JsonKey(ignore: true)
  _$$TypeModelImplCopyWith<_$TypeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
