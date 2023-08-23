// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'DashboardModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DashboardModel _$DashboardModelFromJson(Map<String, dynamic> json) {
  return _DashboardModel.fromJson(json);
}

/// @nodoc
mixin _$DashboardModel {
  String get status => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<BannerModel>? get banners => throw _privateConstructorUsedError;
  List<SpecModel>? get specifications => throw _privateConstructorUsedError;
  List<AstrologerModel>? get new_astrologers =>
      throw _privateConstructorUsedError;
  List<AstrologerModel>? get live_astrologers =>
      throw _privateConstructorUsedError;
  List<BlogModel>? get blogs => throw _privateConstructorUsedError;
  List<VideoModel>? get videos => throw _privateConstructorUsedError;
  List<TestimonialModel>? get testimonials =>
      throw _privateConstructorUsedError;
  UserModel? get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DashboardModelCopyWith<DashboardModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardModelCopyWith<$Res> {
  factory $DashboardModelCopyWith(
          DashboardModel value, $Res Function(DashboardModel) then) =
      _$DashboardModelCopyWithImpl<$Res, DashboardModel>;
  @useResult
  $Res call(
      {String status,
      int code,
      String message,
      List<BannerModel>? banners,
      List<SpecModel>? specifications,
      List<AstrologerModel>? new_astrologers,
      List<AstrologerModel>? live_astrologers,
      List<BlogModel>? blogs,
      List<VideoModel>? videos,
      List<TestimonialModel>? testimonials,
      UserModel? user});

  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class _$DashboardModelCopyWithImpl<$Res, $Val extends DashboardModel>
    implements $DashboardModelCopyWith<$Res> {
  _$DashboardModelCopyWithImpl(this._value, this._then);

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
    Object? banners = freezed,
    Object? specifications = freezed,
    Object? new_astrologers = freezed,
    Object? live_astrologers = freezed,
    Object? blogs = freezed,
    Object? videos = freezed,
    Object? testimonials = freezed,
    Object? user = freezed,
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
      banners: freezed == banners
          ? _value.banners
          : banners // ignore: cast_nullable_to_non_nullable
              as List<BannerModel>?,
      specifications: freezed == specifications
          ? _value.specifications
          : specifications // ignore: cast_nullable_to_non_nullable
              as List<SpecModel>?,
      new_astrologers: freezed == new_astrologers
          ? _value.new_astrologers
          : new_astrologers // ignore: cast_nullable_to_non_nullable
              as List<AstrologerModel>?,
      live_astrologers: freezed == live_astrologers
          ? _value.live_astrologers
          : live_astrologers // ignore: cast_nullable_to_non_nullable
              as List<AstrologerModel>?,
      blogs: freezed == blogs
          ? _value.blogs
          : blogs // ignore: cast_nullable_to_non_nullable
              as List<BlogModel>?,
      videos: freezed == videos
          ? _value.videos
          : videos // ignore: cast_nullable_to_non_nullable
              as List<VideoModel>?,
      testimonials: freezed == testimonials
          ? _value.testimonials
          : testimonials // ignore: cast_nullable_to_non_nullable
              as List<TestimonialModel>?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DashboardModelCopyWith<$Res>
    implements $DashboardModelCopyWith<$Res> {
  factory _$$_DashboardModelCopyWith(
          _$_DashboardModel value, $Res Function(_$_DashboardModel) then) =
      __$$_DashboardModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String status,
      int code,
      String message,
      List<BannerModel>? banners,
      List<SpecModel>? specifications,
      List<AstrologerModel>? new_astrologers,
      List<AstrologerModel>? live_astrologers,
      List<BlogModel>? blogs,
      List<VideoModel>? videos,
      List<TestimonialModel>? testimonials,
      UserModel? user});

  @override
  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class __$$_DashboardModelCopyWithImpl<$Res>
    extends _$DashboardModelCopyWithImpl<$Res, _$_DashboardModel>
    implements _$$_DashboardModelCopyWith<$Res> {
  __$$_DashboardModelCopyWithImpl(
      _$_DashboardModel _value, $Res Function(_$_DashboardModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = null,
    Object? message = null,
    Object? banners = freezed,
    Object? specifications = freezed,
    Object? new_astrologers = freezed,
    Object? live_astrologers = freezed,
    Object? blogs = freezed,
    Object? videos = freezed,
    Object? testimonials = freezed,
    Object? user = freezed,
  }) {
    return _then(_$_DashboardModel(
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
      banners: freezed == banners
          ? _value._banners
          : banners // ignore: cast_nullable_to_non_nullable
              as List<BannerModel>?,
      specifications: freezed == specifications
          ? _value._specifications
          : specifications // ignore: cast_nullable_to_non_nullable
              as List<SpecModel>?,
      new_astrologers: freezed == new_astrologers
          ? _value._new_astrologers
          : new_astrologers // ignore: cast_nullable_to_non_nullable
              as List<AstrologerModel>?,
      live_astrologers: freezed == live_astrologers
          ? _value._live_astrologers
          : live_astrologers // ignore: cast_nullable_to_non_nullable
              as List<AstrologerModel>?,
      blogs: freezed == blogs
          ? _value._blogs
          : blogs // ignore: cast_nullable_to_non_nullable
              as List<BlogModel>?,
      videos: freezed == videos
          ? _value._videos
          : videos // ignore: cast_nullable_to_non_nullable
              as List<VideoModel>?,
      testimonials: freezed == testimonials
          ? _value._testimonials
          : testimonials // ignore: cast_nullable_to_non_nullable
              as List<TestimonialModel>?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DashboardModel implements _DashboardModel {
  _$_DashboardModel(
      {required this.status,
      required this.code,
      required this.message,
      final List<BannerModel>? banners,
      final List<SpecModel>? specifications,
      final List<AstrologerModel>? new_astrologers,
      final List<AstrologerModel>? live_astrologers,
      final List<BlogModel>? blogs,
      final List<VideoModel>? videos,
      final List<TestimonialModel>? testimonials,
      this.user})
      : _banners = banners,
        _specifications = specifications,
        _new_astrologers = new_astrologers,
        _live_astrologers = live_astrologers,
        _blogs = blogs,
        _videos = videos,
        _testimonials = testimonials;

  factory _$_DashboardModel.fromJson(Map<String, dynamic> json) =>
      _$$_DashboardModelFromJson(json);

  @override
  final String status;
  @override
  final int code;
  @override
  final String message;
  final List<BannerModel>? _banners;
  @override
  List<BannerModel>? get banners {
    final value = _banners;
    if (value == null) return null;
    if (_banners is EqualUnmodifiableListView) return _banners;
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

  final List<AstrologerModel>? _new_astrologers;
  @override
  List<AstrologerModel>? get new_astrologers {
    final value = _new_astrologers;
    if (value == null) return null;
    if (_new_astrologers is EqualUnmodifiableListView) return _new_astrologers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<AstrologerModel>? _live_astrologers;
  @override
  List<AstrologerModel>? get live_astrologers {
    final value = _live_astrologers;
    if (value == null) return null;
    if (_live_astrologers is EqualUnmodifiableListView)
      return _live_astrologers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<BlogModel>? _blogs;
  @override
  List<BlogModel>? get blogs {
    final value = _blogs;
    if (value == null) return null;
    if (_blogs is EqualUnmodifiableListView) return _blogs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<VideoModel>? _videos;
  @override
  List<VideoModel>? get videos {
    final value = _videos;
    if (value == null) return null;
    if (_videos is EqualUnmodifiableListView) return _videos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<TestimonialModel>? _testimonials;
  @override
  List<TestimonialModel>? get testimonials {
    final value = _testimonials;
    if (value == null) return null;
    if (_testimonials is EqualUnmodifiableListView) return _testimonials;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final UserModel? user;

  @override
  String toString() {
    return 'DashboardModel(status: $status, code: $code, message: $message, banners: $banners, specifications: $specifications, new_astrologers: $new_astrologers, live_astrologers: $live_astrologers, blogs: $blogs, videos: $videos, testimonials: $testimonials, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DashboardModel &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._banners, _banners) &&
            const DeepCollectionEquality()
                .equals(other._specifications, _specifications) &&
            const DeepCollectionEquality()
                .equals(other._new_astrologers, _new_astrologers) &&
            const DeepCollectionEquality()
                .equals(other._live_astrologers, _live_astrologers) &&
            const DeepCollectionEquality().equals(other._blogs, _blogs) &&
            const DeepCollectionEquality().equals(other._videos, _videos) &&
            const DeepCollectionEquality()
                .equals(other._testimonials, _testimonials) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      code,
      message,
      const DeepCollectionEquality().hash(_banners),
      const DeepCollectionEquality().hash(_specifications),
      const DeepCollectionEquality().hash(_new_astrologers),
      const DeepCollectionEquality().hash(_live_astrologers),
      const DeepCollectionEquality().hash(_blogs),
      const DeepCollectionEquality().hash(_videos),
      const DeepCollectionEquality().hash(_testimonials),
      user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DashboardModelCopyWith<_$_DashboardModel> get copyWith =>
      __$$_DashboardModelCopyWithImpl<_$_DashboardModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DashboardModelToJson(
      this,
    );
  }
}

abstract class _DashboardModel implements DashboardModel {
  factory _DashboardModel(
      {required final String status,
      required final int code,
      required final String message,
      final List<BannerModel>? banners,
      final List<SpecModel>? specifications,
      final List<AstrologerModel>? new_astrologers,
      final List<AstrologerModel>? live_astrologers,
      final List<BlogModel>? blogs,
      final List<VideoModel>? videos,
      final List<TestimonialModel>? testimonials,
      final UserModel? user}) = _$_DashboardModel;

  factory _DashboardModel.fromJson(Map<String, dynamic> json) =
      _$_DashboardModel.fromJson;

  @override
  String get status;
  @override
  int get code;
  @override
  String get message;
  @override
  List<BannerModel>? get banners;
  @override
  List<SpecModel>? get specifications;
  @override
  List<AstrologerModel>? get new_astrologers;
  @override
  List<AstrologerModel>? get live_astrologers;
  @override
  List<BlogModel>? get blogs;
  @override
  List<VideoModel>? get videos;
  @override
  List<TestimonialModel>? get testimonials;
  @override
  UserModel? get user;
  @override
  @JsonKey(ignore: true)
  _$$_DashboardModelCopyWith<_$_DashboardModel> get copyWith =>
      throw _privateConstructorUsedError;
}
