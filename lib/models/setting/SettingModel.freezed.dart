// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'SettingModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SettingModel _$SettingModelFromJson(Map<String, dynamic> json) {
  return _SettingModel.fromJson(json);
}

/// @nodoc
mixin _$SettingModel {
  String get about => throw _privateConstructorUsedError;
  String get tc => throw _privateConstructorUsedError;
  String get privacy_policy => throw _privateConstructorUsedError;
  String get mobile => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get link => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SettingModelCopyWith<SettingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingModelCopyWith<$Res> {
  factory $SettingModelCopyWith(
          SettingModel value, $Res Function(SettingModel) then) =
      _$SettingModelCopyWithImpl<$Res, SettingModel>;
  @useResult
  $Res call(
      {String about,
      String tc,
      String privacy_policy,
      String mobile,
      String email,
      String address,
      String link});
}

/// @nodoc
class _$SettingModelCopyWithImpl<$Res, $Val extends SettingModel>
    implements $SettingModelCopyWith<$Res> {
  _$SettingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? about = null,
    Object? tc = null,
    Object? privacy_policy = null,
    Object? mobile = null,
    Object? email = null,
    Object? address = null,
    Object? link = null,
  }) {
    return _then(_value.copyWith(
      about: null == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String,
      tc: null == tc
          ? _value.tc
          : tc // ignore: cast_nullable_to_non_nullable
              as String,
      privacy_policy: null == privacy_policy
          ? _value.privacy_policy
          : privacy_policy // ignore: cast_nullable_to_non_nullable
              as String,
      mobile: null == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SettingModelCopyWith<$Res>
    implements $SettingModelCopyWith<$Res> {
  factory _$$_SettingModelCopyWith(
          _$_SettingModel value, $Res Function(_$_SettingModel) then) =
      __$$_SettingModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String about,
      String tc,
      String privacy_policy,
      String mobile,
      String email,
      String address,
      String link});
}

/// @nodoc
class __$$_SettingModelCopyWithImpl<$Res>
    extends _$SettingModelCopyWithImpl<$Res, _$_SettingModel>
    implements _$$_SettingModelCopyWith<$Res> {
  __$$_SettingModelCopyWithImpl(
      _$_SettingModel _value, $Res Function(_$_SettingModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? about = null,
    Object? tc = null,
    Object? privacy_policy = null,
    Object? mobile = null,
    Object? email = null,
    Object? address = null,
    Object? link = null,
  }) {
    return _then(_$_SettingModel(
      about: null == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String,
      tc: null == tc
          ? _value.tc
          : tc // ignore: cast_nullable_to_non_nullable
              as String,
      privacy_policy: null == privacy_policy
          ? _value.privacy_policy
          : privacy_policy // ignore: cast_nullable_to_non_nullable
              as String,
      mobile: null == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SettingModel implements _SettingModel {
  _$_SettingModel(
      {required this.about,
      required this.tc,
      required this.privacy_policy,
      required this.mobile,
      required this.email,
      required this.address,
      required this.link});

  factory _$_SettingModel.fromJson(Map<String, dynamic> json) =>
      _$$_SettingModelFromJson(json);

  @override
  final String about;
  @override
  final String tc;
  @override
  final String privacy_policy;
  @override
  final String mobile;
  @override
  final String email;
  @override
  final String address;
  @override
  final String link;

  @override
  String toString() {
    return 'SettingModel(about: $about, tc: $tc, privacy_policy: $privacy_policy, mobile: $mobile, email: $email, address: $address, link: $link)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SettingModel &&
            (identical(other.about, about) || other.about == about) &&
            (identical(other.tc, tc) || other.tc == tc) &&
            (identical(other.privacy_policy, privacy_policy) ||
                other.privacy_policy == privacy_policy) &&
            (identical(other.mobile, mobile) || other.mobile == mobile) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.link, link) || other.link == link));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, about, tc, privacy_policy, mobile, email, address, link);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SettingModelCopyWith<_$_SettingModel> get copyWith =>
      __$$_SettingModelCopyWithImpl<_$_SettingModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SettingModelToJson(
      this,
    );
  }
}

abstract class _SettingModel implements SettingModel {
  factory _SettingModel(
      {required final String about,
      required final String tc,
      required final String privacy_policy,
      required final String mobile,
      required final String email,
      required final String address,
      required final String link}) = _$_SettingModel;

  factory _SettingModel.fromJson(Map<String, dynamic> json) =
      _$_SettingModel.fromJson;

  @override
  String get about;
  @override
  String get tc;
  @override
  String get privacy_policy;
  @override
  String get mobile;
  @override
  String get email;
  @override
  String get address;
  @override
  String get link;
  @override
  @JsonKey(ignore: true)
  _$$_SettingModelCopyWith<_$_SettingModel> get copyWith =>
      throw _privateConstructorUsedError;
}
