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
  String get imageFullUrl => throw _privateConstructorUsedError;

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
  $Res call({int id, String spec, String icon, String imageFullUrl});
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
    Object? imageFullUrl = null,
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
      imageFullUrl: null == imageFullUrl
          ? _value.imageFullUrl
          : imageFullUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SpecModelImplCopyWith<$Res>
    implements $SpecModelCopyWith<$Res> {
  factory _$$SpecModelImplCopyWith(
          _$SpecModelImpl value, $Res Function(_$SpecModelImpl) then) =
      __$$SpecModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String spec, String icon, String imageFullUrl});
}

/// @nodoc
class __$$SpecModelImplCopyWithImpl<$Res>
    extends _$SpecModelCopyWithImpl<$Res, _$SpecModelImpl>
    implements _$$SpecModelImplCopyWith<$Res> {
  __$$SpecModelImplCopyWithImpl(
      _$SpecModelImpl _value, $Res Function(_$SpecModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? spec = null,
    Object? icon = null,
    Object? imageFullUrl = null,
  }) {
    return _then(_$SpecModelImpl(
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
      imageFullUrl: null == imageFullUrl
          ? _value.imageFullUrl
          : imageFullUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SpecModelImpl implements _SpecModel {
  _$SpecModelImpl(
      {required this.id,
      required this.spec,
      required this.icon,
      required this.imageFullUrl});

  factory _$SpecModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpecModelImplFromJson(json);

  @override
  final int id;
  @override
  final String spec;
  @override
  final String icon;
  @override
  final String imageFullUrl;

  @override
  String toString() {
    return 'SpecModel(id: $id, spec: $spec, icon: $icon, imageFullUrl: $imageFullUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpecModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.spec, spec) || other.spec == spec) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.imageFullUrl, imageFullUrl) ||
                other.imageFullUrl == imageFullUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, spec, icon, imageFullUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SpecModelImplCopyWith<_$SpecModelImpl> get copyWith =>
      __$$SpecModelImplCopyWithImpl<_$SpecModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SpecModelImplToJson(
      this,
    );
  }
}

abstract class _SpecModel implements SpecModel {
  factory _SpecModel(
      {required final int id,
      required final String spec,
      required final String icon,
      required final String imageFullUrl}) = _$SpecModelImpl;

  factory _SpecModel.fromJson(Map<String, dynamic> json) =
      _$SpecModelImpl.fromJson;

  @override
  int get id;
  @override
  String get spec;
  @override
  String get icon;
  @override
  String get imageFullUrl;
  @override
  @JsonKey(ignore: true)
  _$$SpecModelImplCopyWith<_$SpecModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
