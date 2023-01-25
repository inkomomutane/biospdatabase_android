// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'biosp_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BiospEntity {
  ULID get ulid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get projectName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BiospEntityCopyWith<BiospEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BiospEntityCopyWith<$Res> {
  factory $BiospEntityCopyWith(
          BiospEntity value, $Res Function(BiospEntity) then) =
      _$BiospEntityCopyWithImpl<$Res, BiospEntity>;
  @useResult
  $Res call({ULID ulid, String name, String projectName});
}

/// @nodoc
class _$BiospEntityCopyWithImpl<$Res, $Val extends BiospEntity>
    implements $BiospEntityCopyWith<$Res> {
  _$BiospEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ulid = null,
    Object? name = null,
    Object? projectName = null,
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
      projectName: null == projectName
          ? _value.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BiospEntityCopyWith<$Res>
    implements $BiospEntityCopyWith<$Res> {
  factory _$$_BiospEntityCopyWith(
          _$_BiospEntity value, $Res Function(_$_BiospEntity) then) =
      __$$_BiospEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ULID ulid, String name, String projectName});
}

/// @nodoc
class __$$_BiospEntityCopyWithImpl<$Res>
    extends _$BiospEntityCopyWithImpl<$Res, _$_BiospEntity>
    implements _$$_BiospEntityCopyWith<$Res> {
  __$$_BiospEntityCopyWithImpl(
      _$_BiospEntity _value, $Res Function(_$_BiospEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ulid = null,
    Object? name = null,
    Object? projectName = null,
  }) {
    return _then(_$_BiospEntity(
      ulid: null == ulid
          ? _value.ulid
          : ulid // ignore: cast_nullable_to_non_nullable
              as ULID,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      projectName: null == projectName
          ? _value.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_BiospEntity extends _BiospEntity {
  const _$_BiospEntity(
      {required this.ulid, required this.name, required this.projectName})
      : super._();

  @override
  final ULID ulid;
  @override
  final String name;
  @override
  final String projectName;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BiospEntityCopyWith<_$_BiospEntity> get copyWith =>
      __$$_BiospEntityCopyWithImpl<_$_BiospEntity>(this, _$identity);
}

abstract class _BiospEntity extends BiospEntity {
  const factory _BiospEntity(
      {required final ULID ulid,
      required final String name,
      required final String projectName}) = _$_BiospEntity;
  const _BiospEntity._() : super._();

  @override
  ULID get ulid;
  @override
  String get name;
  @override
  String get projectName;
  @override
  @JsonKey(ignore: true)
  _$$_BiospEntityCopyWith<_$_BiospEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
