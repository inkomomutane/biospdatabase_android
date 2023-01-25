// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forwarded_service_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ForwardedServiceEntity {
  ULID get ulid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ForwardedServiceEntityCopyWith<ForwardedServiceEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForwardedServiceEntityCopyWith<$Res> {
  factory $ForwardedServiceEntityCopyWith(ForwardedServiceEntity value,
          $Res Function(ForwardedServiceEntity) then) =
      _$ForwardedServiceEntityCopyWithImpl<$Res, ForwardedServiceEntity>;
  @useResult
  $Res call({ULID ulid, String name});
}

/// @nodoc
class _$ForwardedServiceEntityCopyWithImpl<$Res,
        $Val extends ForwardedServiceEntity>
    implements $ForwardedServiceEntityCopyWith<$Res> {
  _$ForwardedServiceEntityCopyWithImpl(this._value, this._then);

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
abstract class _$$_ForwardedServiceEntityCopyWith<$Res>
    implements $ForwardedServiceEntityCopyWith<$Res> {
  factory _$$_ForwardedServiceEntityCopyWith(_$_ForwardedServiceEntity value,
          $Res Function(_$_ForwardedServiceEntity) then) =
      __$$_ForwardedServiceEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ULID ulid, String name});
}

/// @nodoc
class __$$_ForwardedServiceEntityCopyWithImpl<$Res>
    extends _$ForwardedServiceEntityCopyWithImpl<$Res,
        _$_ForwardedServiceEntity>
    implements _$$_ForwardedServiceEntityCopyWith<$Res> {
  __$$_ForwardedServiceEntityCopyWithImpl(_$_ForwardedServiceEntity _value,
      $Res Function(_$_ForwardedServiceEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ulid = null,
    Object? name = null,
  }) {
    return _then(_$_ForwardedServiceEntity(
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

class _$_ForwardedServiceEntity extends _ForwardedServiceEntity {
  const _$_ForwardedServiceEntity({required this.ulid, required this.name})
      : super._();

  @override
  final ULID ulid;
  @override
  final String name;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ForwardedServiceEntityCopyWith<_$_ForwardedServiceEntity> get copyWith =>
      __$$_ForwardedServiceEntityCopyWithImpl<_$_ForwardedServiceEntity>(
          this, _$identity);
}

abstract class _ForwardedServiceEntity extends ForwardedServiceEntity {
  const factory _ForwardedServiceEntity(
      {required final ULID ulid,
      required final String name}) = _$_ForwardedServiceEntity;
  const _ForwardedServiceEntity._() : super._();

  @override
  ULID get ulid;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_ForwardedServiceEntityCopyWith<_$_ForwardedServiceEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
