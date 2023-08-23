// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'HoroscopeModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HoroscopeModel _$HoroscopeModelFromJson(Map<String, dynamic> json) {
  return _HoroscopeModel.fromJson(json);
}

/// @nodoc
mixin _$HoroscopeModel {
  int get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HoroscopeModelCopyWith<HoroscopeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HoroscopeModelCopyWith<$Res> {
  factory $HoroscopeModelCopyWith(
          HoroscopeModel value, $Res Function(HoroscopeModel) then) =
      _$HoroscopeModelCopyWithImpl<$Res, HoroscopeModel>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$HoroscopeModelCopyWithImpl<$Res, $Val extends HoroscopeModel>
    implements $HoroscopeModelCopyWith<$Res> {
  _$HoroscopeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HoroscopeModelCopyWith<$Res>
    implements $HoroscopeModelCopyWith<$Res> {
  factory _$$_HoroscopeModelCopyWith(
          _$_HoroscopeModel value, $Res Function(_$_HoroscopeModel) then) =
      __$$_HoroscopeModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$_HoroscopeModelCopyWithImpl<$Res>
    extends _$HoroscopeModelCopyWithImpl<$Res, _$_HoroscopeModel>
    implements _$$_HoroscopeModelCopyWith<$Res> {
  __$$_HoroscopeModelCopyWithImpl(
      _$_HoroscopeModel _value, $Res Function(_$_HoroscopeModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$_HoroscopeModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HoroscopeModel implements _HoroscopeModel {
  _$_HoroscopeModel({required this.id});

  factory _$_HoroscopeModel.fromJson(Map<String, dynamic> json) =>
      _$$_HoroscopeModelFromJson(json);

  @override
  final int id;

  @override
  String toString() {
    return 'HoroscopeModel(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HoroscopeModel &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HoroscopeModelCopyWith<_$_HoroscopeModel> get copyWith =>
      __$$_HoroscopeModelCopyWithImpl<_$_HoroscopeModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HoroscopeModelToJson(
      this,
    );
  }
}

abstract class _HoroscopeModel implements HoroscopeModel {
  factory _HoroscopeModel({required final int id}) = _$_HoroscopeModel;

  factory _HoroscopeModel.fromJson(Map<String, dynamic> json) =
      _$_HoroscopeModel.fromJson;

  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$_HoroscopeModelCopyWith<_$_HoroscopeModel> get copyWith =>
      throw _privateConstructorUsedError;
}
