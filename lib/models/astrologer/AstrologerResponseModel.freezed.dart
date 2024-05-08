// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'AstrologerResponseModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AstrologerResponseModel _$AstrologerResponseModelFromJson(
    Map<String, dynamic> json) {
  return _AstrologerResponseModel.fromJson(json);
}

/// @nodoc
mixin _$AstrologerResponseModel {
  String get status => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  AstrologerModel? get astrologer => throw _privateConstructorUsedError;
  RatingModel? get rating => throw _privateConstructorUsedError;
  List<LanguageModel>? get languages => throw _privateConstructorUsedError;
  List<SpecModel>? get specifications => throw _privateConstructorUsedError;
  List<TypeModel>? get types => throw _privateConstructorUsedError;
  List<ReviewModel>? get reviews => throw _privateConstructorUsedError;
  List<GalleryModel>? get galleries => throw _privateConstructorUsedError;
  List<AstrologerModel>? get similar => throw _privateConstructorUsedError;
  double? get wallet => throw _privateConstructorUsedError;
  int? get free => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AstrologerResponseModelCopyWith<AstrologerResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AstrologerResponseModelCopyWith<$Res> {
  factory $AstrologerResponseModelCopyWith(AstrologerResponseModel value,
          $Res Function(AstrologerResponseModel) then) =
      _$AstrologerResponseModelCopyWithImpl<$Res, AstrologerResponseModel>;
  @useResult
  $Res call(
      {String status,
      int code,
      String message,
      AstrologerModel? astrologer,
      RatingModel? rating,
      List<LanguageModel>? languages,
      List<SpecModel>? specifications,
      List<TypeModel>? types,
      List<ReviewModel>? reviews,
      List<GalleryModel>? galleries,
      List<AstrologerModel>? similar,
      double? wallet,
      int? free});

  $AstrologerModelCopyWith<$Res>? get astrologer;
  $RatingModelCopyWith<$Res>? get rating;
}

/// @nodoc
class _$AstrologerResponseModelCopyWithImpl<$Res,
        $Val extends AstrologerResponseModel>
    implements $AstrologerResponseModelCopyWith<$Res> {
  _$AstrologerResponseModelCopyWithImpl(this._value, this._then);

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
    Object? astrologer = freezed,
    Object? rating = freezed,
    Object? languages = freezed,
    Object? specifications = freezed,
    Object? types = freezed,
    Object? reviews = freezed,
    Object? galleries = freezed,
    Object? similar = freezed,
    Object? wallet = freezed,
    Object? free = freezed,
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
      astrologer: freezed == astrologer
          ? _value.astrologer
          : astrologer // ignore: cast_nullable_to_non_nullable
              as AstrologerModel?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as RatingModel?,
      languages: freezed == languages
          ? _value.languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<LanguageModel>?,
      specifications: freezed == specifications
          ? _value.specifications
          : specifications // ignore: cast_nullable_to_non_nullable
              as List<SpecModel>?,
      types: freezed == types
          ? _value.types
          : types // ignore: cast_nullable_to_non_nullable
              as List<TypeModel>?,
      reviews: freezed == reviews
          ? _value.reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<ReviewModel>?,
      galleries: freezed == galleries
          ? _value.galleries
          : galleries // ignore: cast_nullable_to_non_nullable
              as List<GalleryModel>?,
      similar: freezed == similar
          ? _value.similar
          : similar // ignore: cast_nullable_to_non_nullable
              as List<AstrologerModel>?,
      wallet: freezed == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as double?,
      free: freezed == free
          ? _value.free
          : free // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AstrologerModelCopyWith<$Res>? get astrologer {
    if (_value.astrologer == null) {
      return null;
    }

    return $AstrologerModelCopyWith<$Res>(_value.astrologer!, (value) {
      return _then(_value.copyWith(astrologer: value) as $Val);
    });
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
abstract class _$$AstrologerResponseModelImplCopyWith<$Res>
    implements $AstrologerResponseModelCopyWith<$Res> {
  factory _$$AstrologerResponseModelImplCopyWith(
          _$AstrologerResponseModelImpl value,
          $Res Function(_$AstrologerResponseModelImpl) then) =
      __$$AstrologerResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String status,
      int code,
      String message,
      AstrologerModel? astrologer,
      RatingModel? rating,
      List<LanguageModel>? languages,
      List<SpecModel>? specifications,
      List<TypeModel>? types,
      List<ReviewModel>? reviews,
      List<GalleryModel>? galleries,
      List<AstrologerModel>? similar,
      double? wallet,
      int? free});

  @override
  $AstrologerModelCopyWith<$Res>? get astrologer;
  @override
  $RatingModelCopyWith<$Res>? get rating;
}

/// @nodoc
class __$$AstrologerResponseModelImplCopyWithImpl<$Res>
    extends _$AstrologerResponseModelCopyWithImpl<$Res,
        _$AstrologerResponseModelImpl>
    implements _$$AstrologerResponseModelImplCopyWith<$Res> {
  __$$AstrologerResponseModelImplCopyWithImpl(
      _$AstrologerResponseModelImpl _value,
      $Res Function(_$AstrologerResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = null,
    Object? message = null,
    Object? astrologer = freezed,
    Object? rating = freezed,
    Object? languages = freezed,
    Object? specifications = freezed,
    Object? types = freezed,
    Object? reviews = freezed,
    Object? galleries = freezed,
    Object? similar = freezed,
    Object? wallet = freezed,
    Object? free = freezed,
  }) {
    return _then(_$AstrologerResponseModelImpl(
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
      astrologer: freezed == astrologer
          ? _value.astrologer
          : astrologer // ignore: cast_nullable_to_non_nullable
              as AstrologerModel?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as RatingModel?,
      languages: freezed == languages
          ? _value._languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<LanguageModel>?,
      specifications: freezed == specifications
          ? _value._specifications
          : specifications // ignore: cast_nullable_to_non_nullable
              as List<SpecModel>?,
      types: freezed == types
          ? _value._types
          : types // ignore: cast_nullable_to_non_nullable
              as List<TypeModel>?,
      reviews: freezed == reviews
          ? _value._reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<ReviewModel>?,
      galleries: freezed == galleries
          ? _value._galleries
          : galleries // ignore: cast_nullable_to_non_nullable
              as List<GalleryModel>?,
      similar: freezed == similar
          ? _value._similar
          : similar // ignore: cast_nullable_to_non_nullable
              as List<AstrologerModel>?,
      wallet: freezed == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as double?,
      free: freezed == free
          ? _value.free
          : free // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AstrologerResponseModelImpl implements _AstrologerResponseModel {
  _$AstrologerResponseModelImpl(
      {required this.status,
      required this.code,
      required this.message,
      this.astrologer,
      this.rating,
      final List<LanguageModel>? languages,
      final List<SpecModel>? specifications,
      final List<TypeModel>? types,
      final List<ReviewModel>? reviews,
      final List<GalleryModel>? galleries,
      final List<AstrologerModel>? similar,
      this.wallet,
      this.free})
      : _languages = languages,
        _specifications = specifications,
        _types = types,
        _reviews = reviews,
        _galleries = galleries,
        _similar = similar;

  factory _$AstrologerResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AstrologerResponseModelImplFromJson(json);

  @override
  final String status;
  @override
  final int code;
  @override
  final String message;
  @override
  final AstrologerModel? astrologer;
  @override
  final RatingModel? rating;
  final List<LanguageModel>? _languages;
  @override
  List<LanguageModel>? get languages {
    final value = _languages;
    if (value == null) return null;
    if (_languages is EqualUnmodifiableListView) return _languages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<SpecModel>? _specifications;
  @override
  List<SpecModel>? get specifications {
    final value = _specifications;
    if (value == null) return null;
    if (_specifications is EqualUnmodifiableListView) return _specifications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<TypeModel>? _types;
  @override
  List<TypeModel>? get types {
    final value = _types;
    if (value == null) return null;
    if (_types is EqualUnmodifiableListView) return _types;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ReviewModel>? _reviews;
  @override
  List<ReviewModel>? get reviews {
    final value = _reviews;
    if (value == null) return null;
    if (_reviews is EqualUnmodifiableListView) return _reviews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<GalleryModel>? _galleries;
  @override
  List<GalleryModel>? get galleries {
    final value = _galleries;
    if (value == null) return null;
    if (_galleries is EqualUnmodifiableListView) return _galleries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<AstrologerModel>? _similar;
  @override
  List<AstrologerModel>? get similar {
    final value = _similar;
    if (value == null) return null;
    if (_similar is EqualUnmodifiableListView) return _similar;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final double? wallet;
  @override
  final int? free;

  @override
  String toString() {
    return 'AstrologerResponseModel(status: $status, code: $code, message: $message, astrologer: $astrologer, rating: $rating, languages: $languages, specifications: $specifications, types: $types, reviews: $reviews, galleries: $galleries, similar: $similar, wallet: $wallet, free: $free)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AstrologerResponseModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.astrologer, astrologer) ||
                other.astrologer == astrologer) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            const DeepCollectionEquality()
                .equals(other._languages, _languages) &&
            const DeepCollectionEquality()
                .equals(other._specifications, _specifications) &&
            const DeepCollectionEquality().equals(other._types, _types) &&
            const DeepCollectionEquality().equals(other._reviews, _reviews) &&
            const DeepCollectionEquality()
                .equals(other._galleries, _galleries) &&
            const DeepCollectionEquality().equals(other._similar, _similar) &&
            (identical(other.wallet, wallet) || other.wallet == wallet) &&
            (identical(other.free, free) || other.free == free));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      code,
      message,
      astrologer,
      rating,
      const DeepCollectionEquality().hash(_languages),
      const DeepCollectionEquality().hash(_specifications),
      const DeepCollectionEquality().hash(_types),
      const DeepCollectionEquality().hash(_reviews),
      const DeepCollectionEquality().hash(_galleries),
      const DeepCollectionEquality().hash(_similar),
      wallet,
      free);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AstrologerResponseModelImplCopyWith<_$AstrologerResponseModelImpl>
      get copyWith => __$$AstrologerResponseModelImplCopyWithImpl<
          _$AstrologerResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AstrologerResponseModelImplToJson(
      this,
    );
  }
}

abstract class _AstrologerResponseModel implements AstrologerResponseModel {
  factory _AstrologerResponseModel(
      {required final String status,
      required final int code,
      required final String message,
      final AstrologerModel? astrologer,
      final RatingModel? rating,
      final List<LanguageModel>? languages,
      final List<SpecModel>? specifications,
      final List<TypeModel>? types,
      final List<ReviewModel>? reviews,
      final List<GalleryModel>? galleries,
      final List<AstrologerModel>? similar,
      final double? wallet,
      final int? free}) = _$AstrologerResponseModelImpl;

  factory _AstrologerResponseModel.fromJson(Map<String, dynamic> json) =
      _$AstrologerResponseModelImpl.fromJson;

  @override
  String get status;
  @override
  int get code;
  @override
  String get message;
  @override
  AstrologerModel? get astrologer;
  @override
  RatingModel? get rating;
  @override
  List<LanguageModel>? get languages;
  @override
  List<SpecModel>? get specifications;
  @override
  List<TypeModel>? get types;
  @override
  List<ReviewModel>? get reviews;
  @override
  List<GalleryModel>? get galleries;
  @override
  List<AstrologerModel>? get similar;
  @override
  double? get wallet;
  @override
  int? get free;
  @override
  @JsonKey(ignore: true)
  _$$AstrologerResponseModelImplCopyWith<_$AstrologerResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
