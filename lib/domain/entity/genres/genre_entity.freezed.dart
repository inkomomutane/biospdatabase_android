// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'genre_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GenreEntity {
  ULID get ulid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GenreEntityCopyWith<GenreEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenreEntityCopyWith<$Res> {
  factory $GenreEntityCopyWith(
          GenreEntity value, $Res Function(GenreEntity) then) =
      _$GenreEntityCopyWithImpl<$Res, GenreEntity>;
  @useResult
  $Res call({ULID ulid, String name});
}

/// @nodoc
class _$GenreEntityCopyWithImpl<$Res, $Val extends GenreEntity>
    implements $GenreEntityCopyWith<$Res> {
  _$GenreEntityCopyWithImpl(this._value, this._then);

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
abstract class _$$_GenreEntityCopyWith<$Res>
    implements $GenreEntityCopyWith<$Res> {
  factory _$$_GenreEntityCopyWith(
          _$_GenreEntity value, $Res Function(_$_GenreEntity) then) =
      __$$_GenreEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ULID ulid, String name});
}

/// @nodoc
class __$$_GenreEntityCopyWithImpl<$Res>
    extends _$GenreEntityCopyWithImpl<$Res, _$_GenreEntity>
    implements _$$_GenreEntityCopyWith<$Res> {
  __$$_GenreEntityCopyWithImpl(
      _$_GenreEntity _value, $Res Function(_$_GenreEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ulid = null,
    Object? name = null,
  }) {
    return _then(_$_GenreEntity(
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

class _$_GenreEntity extends _GenreEntity {
  const _$_GenreEntity({required this.ulid, required this.name}) : super._();

  @override
  final ULID ulid;
  @override
  final String name;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GenreEntityCopyWith<_$_GenreEntity> get copyWith =>
      __$$_GenreEntityCopyWithImpl<_$_GenreEntity>(this, _$identity);
}

abstract class _GenreEntity extends GenreEntity {
  const factory _GenreEntity(
      {required final ULID ulid, required final String name}) = _$_GenreEntity;
  const _GenreEntity._() : super._();

  @override
  ULID get ulid;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_GenreEntityCopyWith<_$_GenreEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
