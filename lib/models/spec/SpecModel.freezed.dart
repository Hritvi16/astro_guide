// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'SpecModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SpecModel _$SpecModelFromJson(Map<String, dynamic> json) {
  return _SpecModel.fromJson(json);
}

/// @nodoc
mixin _$SpecModel {
  int get id => throw _privateConstructorUsedError;
  String get spec => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SpecModelCopyWith<SpecModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpecModelCopyWith<$Res> {
  factory $SpecModelCopyWith(SpecModel value, $Res Function(SpecModel) then) =
      _$SpecModelCopyWithImpl<$Res, SpecModel>;
  @useResult
  $Res call({int id, String spec, String icon});
}

/// @nodoc
class _$SpecModelCopyWithImpl<$Res, $Val extends SpecModel>
    implements $SpecModelCopyWith<$Res> {
  _$SpecModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? spec = null,
    Object? icon = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      spec: null == spec
          ? _value.spec
          : spec // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SpecModelCopyWith<$Res> implements $SpecModelCopyWith<$Res> {
  factory _$$_SpecModelCopyWith(
          _$_SpecModel value, $Res Function(_$_SpecModel) then) =
      __$$_SpecModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String spec, String icon});
}

/// @nodoc
class __$$_SpecModelCopyWithImpl<$Res>
    extends _$SpecModelCopyWithImpl<$Res, _$_SpecModel>
    implements _$$_SpecModelCopyWith<$Res> {
  __$$_SpecModelCopyWithImpl(
      _$_SpecModel _value, $Res Function(_$_SpecModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? spec = null,
    Object? icon = null,
  }) {
    return _then(_$_SpecModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      spec: null == spec
          ? _value.spec
          : spec // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SpecModel implements _SpecModel {
  _$_SpecModel({required this.id, required this.spec, required this.icon});

  factory _$_SpecModel.fromJson(Map<String, dynamic> json) =>
      _$$_SpecModelFromJson(json);

  @override
  final int id;
  @override
  final String spec;
  @override
  final String icon;

  @override
  String toString() {
    return 'SpecModel(id: $id, spec: $spec, icon: $icon)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SpecModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.spec, spec) || other.spec == spec) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, spec, icon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SpecModelCopyWith<_$_SpecModel> get copyWith =>
      __$$_SpecModelCopyWithImpl<_$_SpecModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SpecModelToJson(
      this,
    );
  }
}

abstract class _SpecModel implements SpecModel {
  factory _SpecModel(
      {required final int id,
      required final String spec,
      required final String icon}) = _$_SpecModel;

  factory _SpecModel.fromJson(Map<String, dynamic> json) =
      _$_SpecModel.fromJson;

  @override
  int get id;
  @override
  String get spec;
  @override
  String get icon;
  @override
  @JsonKey(ignore: true)
  _$$_SpecModelCopyWith<_$_SpecModel> get copyWith =>
      throw _privateConstructorUsedError;
}
