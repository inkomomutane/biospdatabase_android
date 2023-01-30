import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ulid4d/ulid4d.dart';

part 'purpose_of_visit_entity.freezed.dart';

@freezed
class PurposeOfVisitEntity extends Equatable with _$PurposeOfVisitEntity {
  const factory PurposeOfVisitEntity(
      {
        int? id,
      required ULID ulid,
      required String name}) = _PurposeOfVisitEntity;

  const PurposeOfVisitEntity._();
  @override
  List<Object?> get props => [id,ulid, name];
}
