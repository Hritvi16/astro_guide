// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'RatingModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RatingModel _$RatingModelFromJson(Map<String, dynamic> json) {
  return _RatingModel.fromJson(json);
}

/// @nodoc
mixin _$RatingModel {
  int get rating1 => throw _privateConstructorUsedError;
  int get rating2 => throw _privateConstructorUsedError;
  int get rating3 => throw _privateConstructorUsedError;
  int get rating4 => throw _privateConstructorUsedError;
  int get rating5 => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RatingModelCopyWith<RatingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RatingModelCopyWith<$Res> {
  factory $RatingModelCopyWith(
          RatingModel value, $Res Function(RatingModel) then) =
      _$RatingModelCopyWithImpl<$Res, RatingModel>;
  @useResult
  $Res call({int rating1, int rating2, int rating3, int rating4, int rating5});
}

/// @nodoc
class _$RatingModelCopyWithImpl<$Res, $Val extends RatingModel>
    implements $RatingModelCopyWith<$Res> {
  _$RatingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rating1 = null,
    Object? rating2 = null,
    Object? rating3 = null,
    Object? rating4 = null,
    Object? rating5 = null,
  }) {
    return _then(_value.copyWith(
      rating1: null == rating1
          ? _value.rating1
          : rating1 // ignore: cast_nullable_to_non_nullable
              as int,
      rating2: null == rating2
          ? _value.rating2
          : rating2 // ignore: cast_nullable_to_non_nullable
              as int,
      rating3: null == rating3
          ? _value.rating3
          : rating3 // ignore: cast_nullable_to_non_nullable
              as int,
      rating4: null == rating4
          ? _value.rating4
          : rating4 // ignore: cast_nullable_to_non_nullable
              as int,
      rating5: null == rating5
          ? _value.rating5
          : rating5 // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RatingModelImplCopyWith<$Res>
    implements $RatingModelCopyWith<$Res> {
  factory _$$RatingModelImplCopyWith(
          _$RatingModelImpl value, $Res Function(_$RatingModelImpl) then) =
      __$$RatingModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int rating1, int rating2, int rating3, int rating4, int rating5});
}

/// @nodoc
class __$$RatingModelImplCopyWithImpl<$Res>
    extends _$RatingModelCopyWithImpl<$Res, _$RatingModelImpl>
    implements _$$RatingModelImplCopyWith<$Res> {
  __$$RatingModelImplCopyWithImpl(
      _$RatingModelImpl _value, $Res Function(_$RatingModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rating1 = null,
    Object? rating2 = null,
    Object? rating3 = null,
    Object? rating4 = null,
    Object? rating5 = null,
  }) {
    return _then(_$RatingModelImpl(
      rating1: null == rating1
          ? _value.rating1
          : rating1 // ignore: cast_nullable_to_non_nullable
              as int,
      rating2: null == rating2
          ? _value.rating2
          : rating2 // ignore: cast_nullable_to_non_nullable
              as int,
      rating3: null == rating3
          ? _value.rating3
          : rating3 // ignore: cast_nullable_to_non_nullable
              as int,
      rating4: null == rating4
          ? _value.rating4
          : rating4 // ignore: cast_nullable_to_non_nullable
              as int,
      rating5: null == rating5
          ? _value.rating5
          : rating5 // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RatingModelImpl implements _RatingModel {
  _$RatingModelImpl(
      {required this.rating1,
      required this.rating2,
      required this.rating3,
      required this.rating4,
      required this.rating5});

  factory _$RatingModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RatingModelImplFromJson(json);

  @override
  final int rating1;
  @override
  final int rating2;
  @override
  final int rating3;
  @override
  final int rating4;
  @override
  final int rating5;

  @override
  String toString() {
    return 'RatingModel(rating1: $rating1, rating2: $rating2, rating3: $rating3, rating4: $rating4, rating5: $rating5)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RatingModelImpl &&
            (identical(other.rating1, rating1) || other.rating1 == rating1) &&
            (identical(other.rating2, rating2) || other.rating2 == rating2) &&
            (identical(other.rating3, rating3) || other.rating3 == rating3) &&
            (identical(other.rating4, rating4) || other.rating4 == rating4) &&
            (identical(other.rating5, rating5) || other.rating5 == rating5));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, rating1, rating2, rating3, rating4, rating5);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RatingModelImplCopyWith<_$RatingModelImpl> get copyWith =>
      __$$RatingModelImplCopyWithImpl<_$RatingModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RatingModelImplToJson(
      this,
    );
  }
}

abstract class _RatingModel implements RatingModel {
  factory _RatingModel(
      {required final int rating1,
      required final int rating2,
      required final int rating3,
      required final int rating4,
      required final int rating5}) = _$RatingModelImpl;

  factory _RatingModel.fromJson(Map<String, dynamic> json) =
      _$RatingModelImpl.fromJson;

  @override
  int get rating1;
  @override
  int get rating2;
  @override
  int get rating3;
  @override
  int get rating4;
  @override
  int get rating5;
  @override
  @JsonKey(ignore: true)
  _$$RatingModelImplCopyWith<_$RatingModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
