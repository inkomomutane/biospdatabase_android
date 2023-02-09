import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ulid4d/ulid4d.dart';

import '../biosps/biosp_entity.dart';
import '../document_types/document_type_entity.dart';
import '../forwarded_services/forwarded_service_entity.dart';
import '../genres/genre_entity.dart';
import '../provenances/provenance_entity.dart';
import '../purposes_of_visit/purpose_of_visit_entity.dart';
import '../reasons_of_opening_case/reason_of_opening_case_entity.dart';

part 'beneficiary_entity.freezed.dart';

@freezed
class BeneficiaryEntity extends Equatable with _$BeneficiaryEntity {
  const BeneficiaryEntity._();
  const factory BeneficiaryEntity({
    int? id,
    required BiospEntity? biospEntity,
    required ULID ulid,
    @Default("") String fullName,
    required GenreEntity? genreEntity,
    @Default(1) int numberOfVisits,
    required DateTime birthDate,
    @Default("") String phone,
    required DateTime serviceDate,
    @Default(true) bool homeCare,
    required DateTime dateReceived,
    required ProvenanceEntity? provenanceEntity,
    required ReasonOfOpeningCaseEntity? reasonOfOpeningCaseEntity,
    @Default("") String otherReasonOfOpeningCase,
    required DocumentTypeEntity? documentTypeEntity,
    @Default("") String otherDocumentType,
    required ForwardedServiceEntity? forwardedServiceEntity,
    @Default("") String otherForwardedService,
    required PurposeOfVisitEntity? purposeOfVisitEntity,
    @Default("") String specifyPurposeOfVisit,
    @Default("") String visitProposes,
    @Default(true) bool status,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _BeneficiaryEntity;

  @override
  List<Object?> get props => [
        id,
        biospEntity,
        ulid,
        fullName,
        genreEntity,
        numberOfVisits,
        birthDate,
        phone,
        serviceDate,
        homeCare,
        dateReceived,
        provenanceEntity,
        reasonOfOpeningCaseEntity,
        otherReasonOfOpeningCase,
        documentTypeEntity,
        otherDocumentType,
        forwardedServiceEntity,
        otherForwardedService,
        purposeOfVisitEntity,
        specifyPurposeOfVisit,
        visitProposes,
        status,
        createdAt,
        updatedAt,
      ];
}
