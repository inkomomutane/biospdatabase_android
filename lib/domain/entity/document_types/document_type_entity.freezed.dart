// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'document_type_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DocumentTypeEntity {
  ULID get ulid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DocumentTypeEntityCopyWith<DocumentTypeEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocumentTypeEntityCopyWith<$Res> {
  factory $DocumentTypeEntityCopyWith(
          DocumentTypeEntity value, $Res Function(DocumentTypeEntity) then) =
      _$DocumentTypeEntityCopyWithImpl<$Res, DocumentTypeEntity>;
  @useResult
  $Res call({ULID ulid, String name});
}

/// @nodoc
class _$DocumentTypeEntityCopyWithImpl<$Res, $Val extends DocumentTypeEntity>
    implements $DocumentTypeEntityCopyWith<$Res> {
  _$DocumentTypeEntityCopyWithImpl(this._value, this._then);

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
abstract class _$$_DocumentTypeEntityCopyWith<$Res>
    implements $DocumentTypeEntityCopyWith<$Res> {
  factory _$$_DocumentTypeEntityCopyWith(_$_DocumentTypeEntity value,
          $Res Function(_$_DocumentTypeEntity) then) =
      __$$_DocumentTypeEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ULID ulid, String name});
}

/// @nodoc
class __$$_DocumentTypeEntityCopyWithImpl<$Res>
    extends _$DocumentTypeEntityCopyWithImpl<$Res, _$_DocumentTypeEntity>
    implements _$$_DocumentTypeEntityCopyWith<$Res> {
  __$$_DocumentTypeEntityCopyWithImpl(
      _$_DocumentTypeEntity _value, $Res Function(_$_DocumentTypeEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ulid = null,
    Object? name = null,
  }) {
    return _then(_$_DocumentTypeEntity(
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

class _$_DocumentTypeEntity extends _DocumentTypeEntity {
  const _$_DocumentTypeEntity({required this.ulid, required this.name})
      : super._();

  @override
  final ULID ulid;
  @override
  final String name;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DocumentTypeEntityCopyWith<_$_DocumentTypeEntity> get copyWith =>
      __$$_DocumentTypeEntityCopyWithImpl<_$_DocumentTypeEntity>(
          this, _$identity);
}

abstract class _DocumentTypeEntity extends DocumentTypeEntity {
  const factory _DocumentTypeEntity(
      {required final ULID ulid,
      required final String name}) = _$_DocumentTypeEntity;
  const _DocumentTypeEntity._() : super._();

  @override
  ULID get ulid;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_DocumentTypeEntityCopyWith<_$_DocumentTypeEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
