// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'SupportChatListModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SupportChatListModel _$SupportChatListModelFromJson(Map<String, dynamic> json) {
  return _SupportChatListModel.fromJson(json);
}

/// @nodoc
mixin _$SupportChatListModel {
  String get status => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<SupportChatModel>? get data => throw _privateConstructorUsedError;
  SupportModel? get support => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SupportChatListModelCopyWith<SupportChatListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SupportChatListModelCopyWith<$Res> {
  factory $SupportChatListModelCopyWith(SupportChatListModel value,
          $Res Function(SupportChatListModel) then) =
      _$SupportChatListModelCopyWithImpl<$Res, SupportChatListModel>;
  @useResult
  $Res call(
      {String status,
      int code,
      String message,
      List<SupportChatModel>? data,
      SupportModel? support});

  $SupportModelCopyWith<$Res>? get support;
}

/// @nodoc
class _$SupportChatListModelCopyWithImpl<$Res,
        $Val extends SupportChatListModel>
    implements $SupportChatListModelCopyWith<$Res> {
  _$SupportChatListModelCopyWithImpl(this._value, this._then);

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
    Object? support = freezed,
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
              as List<SupportChatModel>?,
      support: freezed == support
          ? _value.support
          : support // ignore: cast_nullable_to_non_nullable
              as SupportModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SupportModelCopyWith<$Res>? get support {
    if (_value.support == null) {
      return null;
    }

    return $SupportModelCopyWith<$Res>(_value.support!, (value) {
      return _then(_value.copyWith(support: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SupportChatListModelCopyWith<$Res>
    implements $SupportChatListModelCopyWith<$Res> {
  factory _$$_SupportChatListModelCopyWith(_$_SupportChatListModel value,
          $Res Function(_$_SupportChatListModel) then) =
      __$$_SupportChatListModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String status,
      int code,
      String message,
      List<SupportChatModel>? data,
      SupportModel? support});

  @override
  $SupportModelCopyWith<$Res>? get support;
}

/// @nodoc
class __$$_SupportChatListModelCopyWithImpl<$Res>
    extends _$SupportChatListModelCopyWithImpl<$Res, _$_SupportChatListModel>
    implements _$$_SupportChatListModelCopyWith<$Res> {
  __$$_SupportChatListModelCopyWithImpl(_$_SupportChatListModel _value,
      $Res Function(_$_SupportChatListModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? code = null,
    Object? message = null,
    Object? data = freezed,
    Object? support = freezed,
  }) {
    return _then(_$_SupportChatListModel(
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
              as List<SupportChatModel>?,
      support: freezed == support
          ? _value.support
          : support // ignore: cast_nullable_to_non_nullable
              as SupportModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SupportChatListModel implements _SupportChatListModel {
  _$_SupportChatListModel(
      {required this.status,
      required this.code,
      required this.message,
      final List<SupportChatModel>? data,
      this.support})
      : _data = data;

  factory _$_SupportChatListModel.fromJson(Map<String, dynamic> json) =>
      _$$_SupportChatListModelFromJson(json);

  @override
  final String status;
  @override
  final int code;
  @override
  final String message;
  final List<SupportChatModel>? _data;
  @override
  List<SupportChatModel>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final SupportModel? support;

  @override
  String toString() {
    return 'SupportChatListModel(status: $status, code: $code, message: $message, data: $data, support: $support)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SupportChatListModel &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.support, support) || other.support == support));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, code, message,
      const DeepCollectionEquality().hash(_data), support);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SupportChatListModelCopyWith<_$_SupportChatListModel> get copyWith =>
      __$$_SupportChatListModelCopyWithImpl<_$_SupportChatListModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SupportChatListModelToJson(
      this,
    );
  }
}

abstract class _SupportChatListModel implements SupportChatListModel {
  factory _SupportChatListModel(
      {required final String status,
      required final int code,
      required final String message,
      final List<SupportChatModel>? data,
      final SupportModel? support}) = _$_SupportChatListModel;

  factory _SupportChatListModel.fromJson(Map<String, dynamic> json) =
      _$_SupportChatListModel.fromJson;

  @override
  String get status;
  @override
  int get code;
  @override
  String get message;
  @override
  List<SupportChatModel>? get data;
  @override
  SupportModel? get support;
  @override
  @JsonKey(ignore: true)
  _$$_SupportChatListModelCopyWith<_$_SupportChatListModel> get copyWith =>
      throw _privateConstructorUsedError;
}
