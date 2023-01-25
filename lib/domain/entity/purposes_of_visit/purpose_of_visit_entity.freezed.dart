// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purpose_of_visit_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PurposeOfVisitEntity {
  ULID get ulid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PurposeOfVisitEntityCopyWith<PurposeOfVisitEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurposeOfVisitEntityCopyWith<$Res> {
  factory $PurposeOfVisitEntityCopyWith(PurposeOfVisitEntity value,
          $Res Function(PurposeOfVisitEntity) then) =
      _$PurposeOfVisitEntityCopyWithImpl<$Res, PurposeOfVisitEntity>;
  @useResult
  $Res call({ULID ulid, String name});
}

/// @nodoc
class _$PurposeOfVisitEntityCopyWithImpl<$Res,
        $Val extends PurposeOfVisitEntity>
    implements $PurposeOfVisitEntityCopyWith<$Res> {
  _$PurposeOfVisitEntityCopyWithImpl(this._value, this._then);

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
abstract class _$$_PurposeOfVisitEntityCopyWith<$Res>
    implements $PurposeOfVisitEntityCopyWith<$Res> {
  factory _$$_PurposeOfVisitEntityCopyWith(_$_PurposeOfVisitEntity value,
          $Res Function(_$_PurposeOfVisitEntity) then) =
      __$$_PurposeOfVisitEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ULID ulid, String name});
}

/// @nodoc
class __$$_PurposeOfVisitEntityCopyWithImpl<$Res>
    extends _$PurposeOfVisitEntityCopyWithImpl<$Res, _$_PurposeOfVisitEntity>
    implements _$$_PurposeOfVisitEntityCopyWith<$Res> {
  __$$_PurposeOfVisitEntityCopyWithImpl(_$_PurposeOfVisitEntity _value,
      $Res Function(_$_PurposeOfVisitEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ulid = null,
    Object? name = null,
  }) {
    return _then(_$_PurposeOfVisitEntity(
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

class _$_PurposeOfVisitEntity extends _PurposeOfVisitEntity {
  const _$_PurposeOfVisitEntity({required this.ulid, required this.name})
      : super._();

  @override
  final ULID ulid;
  @override
  final String name;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PurposeOfVisitEntityCopyWith<_$_PurposeOfVisitEntity> get copyWith =>
      __$$_PurposeOfVisitEntityCopyWithImpl<_$_PurposeOfVisitEntity>(
          this, _$identity);
}

abstract class _PurposeOfVisitEntity extends PurposeOfVisitEntity {
  const factory _PurposeOfVisitEntity(
      {required final ULID ulid,
      required final String name}) = _$_PurposeOfVisitEntity;
  const _PurposeOfVisitEntity._() : super._();

  @override
  ULID get ulid;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_PurposeOfVisitEntityCopyWith<_$_PurposeOfVisitEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
