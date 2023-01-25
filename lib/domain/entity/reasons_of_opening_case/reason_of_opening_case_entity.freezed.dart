// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reason_of_opening_case_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReasonOfOpeningCaseEntity {
  ULID get ulid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReasonOfOpeningCaseEntityCopyWith<ReasonOfOpeningCaseEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReasonOfOpeningCaseEntityCopyWith<$Res> {
  factory $ReasonOfOpeningCaseEntityCopyWith(ReasonOfOpeningCaseEntity value,
          $Res Function(ReasonOfOpeningCaseEntity) then) =
      _$ReasonOfOpeningCaseEntityCopyWithImpl<$Res, ReasonOfOpeningCaseEntity>;
  @useResult
  $Res call({ULID ulid, String name});
}

/// @nodoc
class _$ReasonOfOpeningCaseEntityCopyWithImpl<$Res,
        $Val extends ReasonOfOpeningCaseEntity>
    implements $ReasonOfOpeningCaseEntityCopyWith<$Res> {
  _$ReasonOfOpeningCaseEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ulid = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      ulid: null == ulid
          ? _value.ulid
          : ulid // ignore: cast_nullable_to_non_nullable
              as ULID,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReasonOfOpeningCaseEntityCopyWith<$Res>
    implements $ReasonOfOpeningCaseEntityCopyWith<$Res> {
  factory _$$_ReasonOfOpeningCaseEntityCopyWith(
          _$_ReasonOfOpeningCaseEntity value,
          $Res Function(_$_ReasonOfOpeningCaseEntity) then) =
      __$$_ReasonOfOpeningCaseEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ULID ulid, String name});
}

/// @nodoc
class __$$_ReasonOfOpeningCaseEntityCopyWithImpl<$Res>
    extends _$ReasonOfOpeningCaseEntityCopyWithImpl<$Res,
        _$_ReasonOfOpeningCaseEntity>
    implements _$$_ReasonOfOpeningCaseEntityCopyWith<$Res> {
  __$$_ReasonOfOpeningCaseEntityCopyWithImpl(
      _$_ReasonOfOpeningCaseEntity _value,
      $Res Function(_$_ReasonOfOpeningCaseEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ulid = null,
    Object? name = null,
  }) {
    return _then(_$_ReasonOfOpeningCaseEntity(
      ulid: null == ulid
          ? _value.ulid
          : ulid // ignore: cast_nullable_to_non_nullable
              as ULID,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ReasonOfOpeningCaseEntity extends _ReasonOfOpeningCaseEntity {
  const _$_ReasonOfOpeningCaseEntity({required this.ulid, required this.name})
      : super._();

  @override
  final ULID ulid;
  @override
  final String name;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReasonOfOpeningCaseEntityCopyWith<_$_ReasonOfOpeningCaseEntity>
      get copyWith => __$$_ReasonOfOpeningCaseEntityCopyWithImpl<
          _$_ReasonOfOpeningCaseEntity>(this, _$identity);
}

abstract class _ReasonOfOpeningCaseEntity extends ReasonOfOpeningCaseEntity {
  const factory _ReasonOfOpeningCaseEntity(
      {required final ULID ulid,
      required final String name}) = _$_ReasonOfOpeningCaseEntity;
  const _ReasonOfOpeningCaseEntity._() : super._();

  @override
  ULID get ulid;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_ReasonOfOpeningCaseEntityCopyWith<_$_ReasonOfOpeningCaseEntity>
      get copyWith => throw _privateConstructorUsedError;
}
