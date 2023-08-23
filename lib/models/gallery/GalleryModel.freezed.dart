// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'GalleryModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GalleryModel _$GalleryModelFromJson(Map<String, dynamic> json) {
  return _GalleryModel.fromJson(json);
}

/// @nodoc
mixin _$GalleryModel {
  int get id => throw _privateConstructorUsedError;
  int get astro_id => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GalleryModelCopyWith<GalleryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GalleryModelCopyWith<$Res> {
  factory $GalleryModelCopyWith(
          GalleryModel value, $Res Function(GalleryModel) then) =
      _$GalleryModelCopyWithImpl<$Res, GalleryModel>;
  @useResult
  $Res call({int id, int astro_id, String image});
}

/// @nodoc
class _$GalleryModelCopyWithImpl<$Res, $Val extends GalleryModel>
    implements $GalleryModelCopyWith<$Res> {
  _$GalleryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? astro_id = null,
    Object? image = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      astro_id: null == astro_id
          ? _value.astro_id
          : astro_id // ignore: cast_nullable_to_non_nullable
              as int,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GalleryModelCopyWith<$Res>
    implements $GalleryModelCopyWith<$Res> {
  factory _$$_GalleryModelCopyWith(
          _$_GalleryModel value, $Res Function(_$_GalleryModel) then) =
      __$$_GalleryModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, int astro_id, String image});
}

/// @nodoc
class __$$_GalleryModelCopyWithImpl<$Res>
    extends _$GalleryModelCopyWithImpl<$Res, _$_GalleryModel>
    implements _$$_GalleryModelCopyWith<$Res> {
  __$$_GalleryModelCopyWithImpl(
      _$_GalleryModel _value, $Res Function(_$_GalleryModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? astro_id = null,
    Object? image = null,
  }) {
    return _then(_$_GalleryModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      astro_id: null == astro_id
          ? _value.astro_id
          : astro_id // ignore: cast_nullable_to_non_nullable
              as int,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GalleryModel implements _GalleryModel {
  _$_GalleryModel(
      {required this.id, required this.astro_id, required this.image});

  factory _$_GalleryModel.fromJson(Map<String, dynamic> json) =>
      _$$_GalleryModelFromJson(json);

  @override
  final int id;
  @override
  final int astro_id;
  @override
  final String image;

  @override
  String toString() {
    return 'GalleryModel(id: $id, astro_id: $astro_id, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GalleryModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.astro_id, astro_id) ||
                other.astro_id == astro_id) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, astro_id, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GalleryModelCopyWith<_$_GalleryModel> get copyWith =>
      __$$_GalleryModelCopyWithImpl<_$_GalleryModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GalleryModelToJson(
      this,
    );
  }
}

abstract class _GalleryModel implements GalleryModel {
  factory _GalleryModel(
      {required final int id,
      required final int astro_id,
      required final String image}) = _$_GalleryModel;

  factory _GalleryModel.fromJson(Map<String, dynamic> json) =
      _$_GalleryModel.fromJson;

  @override
  int get id;
  @override
  int get astro_id;
  @override
  String get image;
  @override
  @JsonKey(ignore: true)
  _$$_GalleryModelCopyWith<_$_GalleryModel> get copyWith =>
      throw _privateConstructorUsedError;
}
