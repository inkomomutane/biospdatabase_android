import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ulid4d/ulid4d.dart';
part 'provenance_entity.freezed.dart';

@freezed
class ProvenanceEntity extends Equatable with _$ProvenanceEntity{
  const factory ProvenanceEntity({
    required ULID ulid,
    required String name,
}) = _ProvenanceEntity;

  const ProvenanceEntity._();
  @override
  List<Object?> get props => [ulid,name];
}