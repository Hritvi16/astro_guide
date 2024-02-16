// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'CheckSessionResponseModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CheckSessionResponseModel _$CheckSessionResponseModelFromJson(
    Map<String, dynamic> json) {
  return _CheckSessionResponseModel.fromJson(json);
}

/// @nodoc
mixin _$CheckSessionResponseModel {
  String get status => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  int? get ch_id => throw _privateConstructorUsedError;
  String? get started_at => throw _privateConstructorUsedError;
  int? get rate => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  CheckSessionModel? get data => throw _privateConstructorUsedError;
  List<CityModel>? get cities => throw _privateConstructorUsedError;
  List<KundliModel>? get kundlis => throw _privateConstructorUsedError;
  List<RelationModel>? get relations => throw _privateConstructorUsedError;
  double? get wallet => throw _privateConstructorUsedError;
  int? get sess_id => throw _privateConstructorUsedError;
  SessionHistoryModel? get session_history =>
      throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CheckSessionResponseModelCopyWith<CheckSessionResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckSessionResponseModelCopyWith<$Res> {
  factory $CheckSessionResponseModelCopyWith(CheckSessionResponseModel value,
          $Res Function(CheckSessionResponseModel) then) =
      _$CheckSessionResponseModelCopyWithImpl<$Res, CheckSessionResponseModel>;
  @useResult
  $Res call(
      {String status,
      int code,
      String message,
      int? ch_id,
      String? started_at,
      int? rate,
      String? type,
      CheckSessionModel? data,
      List<CityModel>? cities,
      List<KundliModel>? kundlis,
      List<RelationModel>? relations,
      double? wallet,
      int? sess_id,
      SessionHistoryModel? session_history,
      String? token});

  $CheckSessionModelCopyWith<$Res>? get data;
  $SessionHistoryModelCopyWith<$Res>? get session_history;
}

/// @nodoc
class _$CheckSessionResponseModelCopyWithImpl<$Res,
        $Val extends CheckSessionResponseModel>
    implements $CheckSessionResponseModelCopyWith<$Res> {
  _$CheckSessionResponseModelCopyWithImpl(this._value, this._then);

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
    Object? ch_id = freezed,
    Object? started_at = freezed,
    Object? rate = freezed,
    Object? type = freezed,
    Object? data = freezed,
    Object? cities = freezed,
    Object? kundlis = freezed,
    Object? relations = freezed,
    Object? wallet = freezed,
    Object? sess_id = freezed,
    Object? session_history = freezed,
    Object? token = freezed,
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
      ch_id: freezed == ch_id
          ? _value.ch_id
          : ch_id // ignore: cast_nullable_to_non_nullable
              as int?,
      started_at: freezed == started_at
          ? _value.started_at
          : started_at // ignore: cast_nullable_to_non_nullable
              as String?,
      rate: freezed == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as CheckSessionModel?,
      cities: freezed == cities
          ? _value.cities
          : cities // ignore: cast_nullable_to_non_nullable
              as List<CityModel>?,
      kundlis: freezed == kundlis
          ? _value.kundlis
          : kundlis // ignore: cast_nullable_to_non_nullable
              as List<KundliModel>?,
      relations: freezed == relations
          ? _value.relations
          : relations // ignore: cast_nullable_to_non_nullable
              as List<RelationModel>?,
      wallet: freezed == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as double?,
      sess_id: freezed == sess_id
          ? _value.sess_id
          : sess_id // ignore: cast_nullable_to_non_nullable
              as int?,
      session_history: freezed == session_history
          ? _value.session_history
          : session_history // ignore: cast_nullable_to_non_nullable
              as SessionHistoryModel?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CheckSessionModelCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $CheckSessionModelCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SessionHistoryModelCopyWith<$Res>? get session_history {
    if (_value.session_history == null) {
      return null;
    }

    return $SessionHistoryModelCopyWith<$Res>(_value.session_history!, (value) {
      return _then(_value.copyWith(session_history: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CheckSessionResponseModelImplCopyWith<$Res>
    implements $CheckSessionResponseModelCopyWith<$Res> {
  factory _$$CheckSessionResponseModelImplCopyWith(
          _$CheckSessionResponseModelImpl value,
          $Res Function(_$CheckSessionResponseModelImpl) then) =
      __$$CheckSessionResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String status,
      int code,
      String message,
      int? ch_id,
      String? started_at,
      int? rate,
      String? type,
      CheckSessionModel? data,
      List<CityModel>? cities,
      List<KundliModel>? kundlis,
      List<RelationModel>? relations,
      double? wallet,
      int? sess_id,
      SessionHistoryModel? session_history,
      String? token});

  @override
  $CheckSessionModelCopyWith<$Res>? get data;
  @override
  $SessionHistoryModelCopyWith<$Res>? get session_history;
}

/// @nodoc
class __$$CheckSessionResponseModelImplCopyWithImpl<$Res>
    extends _$CheckSessionResponseModelCopyWithImpl<$Res,
        _$CheckSessionResponseModelImpl>
    implements _$$CheckSessionResponseModelImplCopyWith<$Res> {
  __$$CheckSessionResponseModelImplCopyWithImpl(
      _$CheckSessionResponseModelImpl _value,
      $Res Function(_$CheckSessionResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = null,
    Object? message = null,
    Object? ch_id = freezed,
    Object? started_at = freezed,
    Object? rate = freezed,
    Object? type = freezed,
    Object? data = freezed,
    Object? cities = freezed,
    Object? kundlis = freezed,
    Object? relations = freezed,
    Object? wallet = freezed,
    Object? sess_id = freezed,
    Object? session_history = freezed,
    Object? token = freezed,
  }) {
    return _then(_$CheckSessionResponseModelImpl(
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
      ch_id: freezed == ch_id
          ? _value.ch_id
          : ch_id // ignore: cast_nullable_to_non_nullable
              as int?,
      started_at: freezed == started_at
          ? _value.started_at
          : started_at // ignore: cast_nullable_to_non_nullable
              as String?,
      rate: freezed == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as CheckSessionModel?,
      cities: freezed == cities
          ? _value._cities
          : cities // ignore: cast_nullable_to_non_nullable
              as List<CityModel>?,
      kundlis: freezed == kundlis
          ? _value._kundlis
          : kundlis // ignore: cast_nullable_to_non_nullable
              as List<KundliModel>?,
      relations: freezed == relations
          ? _value._relations
          : relations // ignore: cast_nullable_to_non_nullable
              as List<RelationModel>?,
      wallet: freezed == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as double?,
      sess_id: freezed == sess_id
          ? _value.sess_id
          : sess_id // ignore: cast_nullable_to_non_nullable
              as int?,
      session_history: freezed == session_history
          ? _value.session_history
          : session_history // ignore: cast_nullable_to_non_nullable
              as SessionHistoryModel?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CheckSessionResponseModelImpl implements _CheckSessionResponseModel {
  _$CheckSessionResponseModelImpl(
      {required this.status,
      required this.code,
      required this.message,
      this.ch_id,
      this.started_at,
      this.rate,
      this.type,
      this.data,
      final List<CityModel>? cities,
      final List<KundliModel>? kundlis,
      final List<RelationModel>? relations,
      this.wallet,
      this.sess_id,
      this.session_history,
      this.token})
      : _cities = cities,
        _kundlis = kundlis,
        _relations = relations;

  factory _$CheckSessionResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CheckSessionResponseModelImplFromJson(json);

  @override
  final String status;
  @override
  final int code;
  @override
  final String message;
  @override
  final int? ch_id;
  @override
  final String? started_at;
  @override
  final int? rate;
  @override
  final String? type;
  @override
  final CheckSessionModel? data;
  final List<CityModel>? _cities;
  @override
  List<CityModel>? get cities {
    final value = _cities;
    if (value == null) return null;
    if (_cities is EqualUnmodifiableListView) return _cities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<KundliModel>? _kundlis;
  @override
  List<KundliModel>? get kundlis {
    final value = _kundlis;
    if (value == null) return null;
    if (_kundlis is EqualUnmodifiableListView) return _kundlis;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<RelationModel>? _relations;
  @override
  List<RelationModel>? get relations {
    final value = _relations;
    if (value == null) return null;
    if (_relations is EqualUnmodifiableListView) return _relations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final double? wallet;
  @override
  final int? sess_id;
  @override
  final SessionHistoryModel? session_history;
  @override
  final String? token;

  @override
  String toString() {
    return 'CheckSessionResponseModel(status: $status, code: $code, message: $message, ch_id: $ch_id, started_at: $started_at, rate: $rate, type: $type, data: $data, cities: $cities, kundlis: $kundlis, relations: $relations, wallet: $wallet, sess_id: $sess_id, session_history: $session_history, token: $token)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckSessionResponseModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.ch_id, ch_id) || other.ch_id == ch_id) &&
            (identical(other.started_at, started_at) ||
                other.started_at == started_at) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.data, data) || other.data == data) &&
            const DeepCollectionEquality().equals(other._cities, _cities) &&
            const DeepCollectionEquality().equals(other._kundlis, _kundlis) &&
            const DeepCollectionEquality()
                .equals(other._relations, _relations) &&
            (identical(other.wallet, wallet) || other.wallet == wallet) &&
            (identical(other.sess_id, sess_id) || other.sess_id == sess_id) &&
            (identical(other.session_history, session_history) ||
                other.session_history == session_history) &&
            (identical(other.token, token) || other.token == token));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      code,
      message,
      ch_id,
      started_at,
      rate,
      type,
      data,
      const DeepCollectionEquality().hash(_cities),
      const DeepCollectionEquality().hash(_kundlis),
      const DeepCollectionEquality().hash(_relations),
      wallet,
      sess_id,
      session_history,
      token);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckSessionResponseModelImplCopyWith<_$CheckSessionResponseModelImpl>
      get copyWith => __$$CheckSessionResponseModelImplCopyWithImpl<
          _$CheckSessionResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckSessionResponseModelImplToJson(
      this,
    );
  }
}

abstract class _CheckSessionResponseModel implements CheckSessionResponseModel {
  factory _CheckSessionResponseModel(
      {required final String status,
      required final int code,
      required final String message,
      final int? ch_id,
      final String? started_at,
      final int? rate,
      final String? type,
      final CheckSessionModel? data,
      final List<CityModel>? cities,
      final List<KundliModel>? kundlis,
      final List<RelationModel>? relations,
      final double? wallet,
      final int? sess_id,
      final SessionHistoryModel? session_history,
      final String? token}) = _$CheckSessionResponseModelImpl;

  factory _CheckSessionResponseModel.fromJson(Map<String, dynamic> json) =
      _$CheckSessionResponseModelImpl.fromJson;

  @override
  String get status;
  @override
  int get code;
  @override
  String get message;
  @override
  int? get ch_id;
  @override
  String? get started_at;
  @override
  int? get rate;
  @override
  String? get type;
  @override
  CheckSessionModel? get data;
  @override
  List<CityModel>? get cities;
  @override
  List<KundliModel>? get kundlis;
  @override
  List<RelationModel>? get relations;
  @override
  double? get wallet;
  @override
  int? get sess_id;
  @override
  SessionHistoryModel? get session_history;
  @override
  String? get token;
  @override
  @JsonKey(ignore: true)
  _$$CheckSessionResponseModelImplCopyWith<_$CheckSessionResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
