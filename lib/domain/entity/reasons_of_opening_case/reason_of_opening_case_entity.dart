import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ulid4d/ulid4d.dart';

part 'reason_of_opening_case_entity.freezed.dart';

@freezed
class ReasonOfOpeningCaseEntity extends Equatable with _$ReasonOfOpeningCaseEntity {
  const factory ReasonOfOpeningCaseEntity({
    required ULID ulid,
    required String name
  }) = _ReasonOfOpeningCaseEntity;

  const ReasonOfOpeningCaseEntity._();
  @override
  List<Object?> get props => [ulid,name];
}