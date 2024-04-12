// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ErrorModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ErrorModel _$ErrorModelFromJson(Map<String, dynamic> json) {
  return _ErrorModel.fromJson(json);
}

/// @nodoc
mixin _$ErrorModel {
  String? get code => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get source => throw _privateConstructorUsedError;
  String? get step => throw _privateConstructorUsedError;
  String? get reason => throw _privateConstructorUsedError;
  MetadataModel? get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ErrorModelCopyWith<ErrorModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorModelCopyWith<$Res> {
  factory $ErrorModelCopyWith(
          ErrorModel value, $Res Function(ErrorModel) then) =
      _$ErrorModelCopyWithImpl<$Res, ErrorModel>;
  @useResult
  $Res call(
      {String? code,
      String? description,
      String? source,
      String? step,
      String? reason,
      MetadataModel? metadata});

  $MetadataModelCopyWith<$Res>? get metadata;
}

/// @nodoc
class _$ErrorModelCopyWithImpl<$Res, $Val extends ErrorModel>
    implements $ErrorModelCopyWith<$Res> {
  _$ErrorModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? description = freezed,
    Object? source = freezed,
    Object? step = freezed,
    Object? reason = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_value.copyWith(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
      step: freezed == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as MetadataModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MetadataModelCopyWith<$Res>? get metadata {
    if (_value.metadata == null) {
      return null;
    }

    return $MetadataModelCopyWith<$Res>(_value.metadata!, (value) {
      return _then(_value.copyWith(metadata: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ErrorModelImplCopyWith<$Res>
    implements $ErrorModelCopyWith<$Res> {
  factory _$$ErrorModelImplCopyWith(
          _$ErrorModelImpl value, $Res Function(_$ErrorModelImpl) then) =
      __$$ErrorModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? code,
      String? description,
      String? source,
      String? step,
      String? reason,
      MetadataModel? metadata});

  @override
  $MetadataModelCopyWith<$Res>? get metadata;
}

/// @nodoc
class __$$ErrorModelImplCopyWithImpl<$Res>
    extends _$ErrorModelCopyWithImpl<$Res, _$ErrorModelImpl>
    implements _$$ErrorModelImplCopyWith<$Res> {
  __$$ErrorModelImplCopyWithImpl(
      _$ErrorModelImpl _value, $Res Function(_$ErrorModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? description = freezed,
    Object? source = freezed,
    Object? step = freezed,
    Object? reason = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_$ErrorModelImpl(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
      step: freezed == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as String?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as MetadataModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ErrorModelImpl implements _ErrorModel {
  _$ErrorModelImpl(
      {this.code,
      this.description,
      this.source,
      this.step,
      this.reason,
      this.metadata});

  factory _$ErrorModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ErrorModelImplFromJson(json);

  @override
  final String? code;
  @override
  final String? description;
  @override
  final String? source;
  @override
  final String? step;
  @override
  final String? reason;
  @override
  final MetadataModel? metadata;

  @override
  String toString() {
    return 'ErrorModel(code: $code, description: $description, source: $source, step: $step, reason: $reason, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorModelImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.step, step) || other.step == step) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.metadata, metadata) ||
                other.metadata == metadata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, code, description, source, step, reason, metadata);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorModelImplCopyWith<_$ErrorModelImpl> get copyWith =>
      __$$ErrorModelImplCopyWithImpl<_$ErrorModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ErrorModelImplToJson(
      this,
    );
  }
}

abstract class _ErrorModel implements ErrorModel {
  factory _ErrorModel(
      {final String? code,
      final String? description,
      final String? source,
      final String? step,
      final String? reason,
      final MetadataModel? metadata}) = _$ErrorModelImpl;

  factory _ErrorModel.fromJson(Map<String, dynamic> json) =
      _$ErrorModelImpl.fromJson;

  @override
  String? get code;
  @override
  String? get description;
  @override
  String? get source;
  @override
  String? get step;
  @override
  String? get reason;
  @override
  MetadataModel? get metadata;
  @override
  @JsonKey(ignore: true)
  _$$ErrorModelImplCopyWith<_$ErrorModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
