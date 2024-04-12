// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ReviewListModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReviewListModel _$ReviewListModelFromJson(Map<String, dynamic> json) {
  return _ReviewListModel.fromJson(json);
}

/// @nodoc
mixin _$ReviewListModel {
  String get status => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<ReviewModel>? get data => throw _privateConstructorUsedError;
  RatingModel? get rating => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReviewListModelCopyWith<ReviewListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewListModelCopyWith<$Res> {
  factory $ReviewListModelCopyWith(
          ReviewListModel value, $Res Function(ReviewListModel) then) =
      _$ReviewListModelCopyWithImpl<$Res, ReviewListModel>;
  @useResult
  $Res call(
      {String status,
      int code,
      String message,
      List<ReviewModel>? data,
      RatingModel? rating});

  $RatingModelCopyWith<$Res>? get rating;
}

/// @nodoc
class _$ReviewListModelCopyWithImpl<$Res, $Val extends ReviewListModel>
    implements $ReviewListModelCopyWith<$Res> {
  _$ReviewListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = null,
    Object? message = null,
    Object? data = freezed,
    Object? rating = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ReviewModel>?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as RatingModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RatingModelCopyWith<$Res>? get rating {
    if (_value.rating == null) {
      return null;
    }

    return $RatingModelCopyWith<$Res>(_value.rating!, (value) {
      return _then(_value.copyWith(rating: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReviewListModelImplCopyWith<$Res>
    implements $ReviewListModelCopyWith<$Res> {
  factory _$$ReviewListModelImplCopyWith(_$ReviewListModelImpl value,
          $Res Function(_$ReviewListModelImpl) then) =
      __$$ReviewListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String status,
      int code,
      String message,
      List<ReviewModel>? data,
      RatingModel? rating});

  @override
  $RatingModelCopyWith<$Res>? get rating;
}

/// @nodoc
class __$$ReviewListModelImplCopyWithImpl<$Res>
    extends _$ReviewListModelCopyWithImpl<$Res, _$ReviewListModelImpl>
    implements _$$ReviewListModelImplCopyWith<$Res> {
  __$$ReviewListModelImplCopyWithImpl(
      _$ReviewListModelImpl _value, $Res Function(_$ReviewListModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = null,
    Object? message = null,
    Object? data = freezed,
    Object? rating = freezed,
  }) {
    return _then(_$ReviewListModelImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ReviewModel>?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as RatingModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReviewListModelImpl implements _ReviewListModel {
  _$ReviewListModelImpl(
      {required this.status,
      required this.code,
      required this.message,
      final List<ReviewModel>? data,
      this.rating})
      : _data = data;

  factory _$ReviewListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewListModelImplFromJson(json);

  @override
  final String status;
  @override
  final int code;
  @override
  final String message;
  final List<ReviewModel>? _data;
  @override
  List<ReviewModel>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final RatingModel? rating;

  @override
  String toString() {
    return 'ReviewListModel(status: $status, code: $code, message: $message, data: $data, rating: $rating)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewListModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.rating, rating) || other.rating == rating));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, code, message,
      const DeepCollectionEquality().hash(_data), rating);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewListModelImplCopyWith<_$ReviewListModelImpl> get copyWith =>
      __$$ReviewListModelImplCopyWithImpl<_$ReviewListModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewListModelImplToJson(
      this,
    );
  }
}

abstract class _ReviewListModel implements ReviewListModel {
  factory _ReviewListModel(
      {required final String status,
      required final int code,
      required final String message,
      final List<ReviewModel>? data,
      final RatingModel? rating}) = _$ReviewListModelImpl;

  factory _ReviewListModel.fromJson(Map<String, dynamic> json) =
      _$ReviewListModelImpl.fromJson;

  @override
  String get status;
  @override
  int get code;
  @override
  String get message;
  @override
  List<ReviewModel>? get data;
  @override
  RatingModel? get rating;
  @override
  @JsonKey(ignore: true)
  _$$ReviewListModelImplCopyWith<_$ReviewListModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
