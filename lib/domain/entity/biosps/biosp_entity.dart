import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ulid4d/ulid4d.dart';

part 'biosp_entity.freezed.dart';
@freezed
class BiospEntity extends Equatable with _$BiospEntity{
  const BiospEntity._();
  const factory BiospEntity({
    int? id,
    required ULID ulid,
    required String name,
    required String projectName,
  }) = _BiospEntity;

  @override
  List<Object?> get props => [id,ulid,name,projectName];
}