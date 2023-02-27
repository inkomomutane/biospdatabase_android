import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:ulid4d/ulid4d.dart';

import '../../../core/inject.dart';
import '../../../domain/entity/beneficiaries/beneficiary_entity.dart';
import '../../datasource/isar/model/beneficiaries/beneficiary.dart';
import '../../datasource/isar/model/biosps/biosp.dart';
import '../../datasource/isar/model/document_types/document_type.dart';
import '../../datasource/isar/model/forwarded_services/forwarded_service.dart';
import '../../datasource/isar/model/genres/genre.dart';
import '../../datasource/isar/model/provenances/provenance.dart';
import '../../datasource/isar/model/purposes_of_visit/purpose_of_visit.dart';
import '../../datasource/isar/model/reasons_of_opening_case/reason_of_opening_case.dart';
import '../biosps/biosp_dto.dart';
import '../document_types/document_type_dto.dart';
import '../forwarded_services/forwarded_service_dto.dart';
import '../genres/genre_dto.dart';
import '../provenances/provenance_dto.dart';
import '../purpose_of_visits/purpose_of_visit_dto.dart';
import '../reasons_of_opening_cases/reasons_of_opening_case_dto.dart';

abstract class BeneficiaryDto {
  static BeneficiaryEntity fromIsar(Beneficiary? beneficiary) =>
      BeneficiaryEntity(
        ulid: ULID.fromString(beneficiary!.ulid),
        biospEntity: BiospDto.fromIsar(beneficiary.biosp.value),
        genreEntity: GenreDto.fromIsar(beneficiary.genre.value),
        birthDate: beneficiary.birthDate,
        serviceDate: beneficiary.serviceDate,
        dateReceived: beneficiary.dateReceived,
        provenanceEntity: ProvenanceDto.fromIsar(beneficiary.provenance.value),
        reasonOfOpeningCaseEntity: ReasonOfOpeningCaseDto.fromIsar(
            beneficiary.reasonOfOpeningCase.value),
        documentTypeEntity:
            DocumentTypeDto.fromIsar(beneficiary.documentType.value),
        otherDocumentType: beneficiary.otherDocumentType,
        forwardedServiceEntity:
            ForwardedServiceDto.fromIsar(beneficiary.forwardedService.value),
        otherForwardedService: beneficiary.otherForwardedService,
        purposeOfVisitEntity:
            PurposeOfVisitDto.fromIsar(beneficiary.purposeOfVisit.value),
        otherReasonOfOpeningCase: beneficiary.otherReasonOfOpeningCase,
        fullName: beneficiary.fullName,
        homeCare: beneficiary.homeCare,
        numberOfVisits: beneficiary.numberOfVisits,
        phone: beneficiary.phone,
        specifyPurposeOfVisit: beneficiary.specifyPurposeOfVisit,
        visitProposes: beneficiary.visitProposes,
        status: beneficiary.status,
        id: beneficiary.id,
        createdAt: beneficiary.createdAt,
        updatedAt: beneficiary.updatedAt,
        specifyForwardedService: beneficiary.specifyForwardedService,
      );

  static Beneficiary fromEntity(BeneficiaryEntity beneficiaryEntity) =>
      Beneficiary()
        ..fullName = beneficiaryEntity.fullName
        ..biosp.value = BiospDto.fromEntity(beneficiaryEntity.biospEntity)
        ..ulid = beneficiaryEntity.ulid.toString()
        ..genre.value = GenreDto.fromEntity(beneficiaryEntity.genreEntity)
        ..birthDate = beneficiaryEntity.birthDate
        ..serviceDate = beneficiaryEntity.serviceDate
        ..dateReceived = beneficiaryEntity.dateReceived
        ..provenance.value =
            ProvenanceDto.fromEntity(beneficiaryEntity.provenanceEntity)
        ..reasonOfOpeningCase.value = ReasonOfOpeningCaseDto.fromEntity(
            beneficiaryEntity.reasonOfOpeningCaseEntity)
        ..documentType.value =
            DocumentTypeDto.fromEntity(beneficiaryEntity.documentTypeEntity)
        ..otherDocumentType = beneficiaryEntity.otherDocumentType
        ..forwardedService.value = ForwardedServiceDto.fromEntity(
            beneficiaryEntity.forwardedServiceEntity)
        ..otherForwardedService = beneficiaryEntity.otherForwardedService
        ..purposeOfVisit.value =
            PurposeOfVisitDto.fromEntity(beneficiaryEntity.purposeOfVisitEntity)
        ..otherReasonOfOpeningCase = beneficiaryEntity.otherReasonOfOpeningCase
        ..homeCare = beneficiaryEntity.homeCare
        ..numberOfVisits = beneficiaryEntity.numberOfVisits
        ..phone = beneficiaryEntity.phone
        ..specifyPurposeOfVisit = beneficiaryEntity.specifyPurposeOfVisit
        ..visitProposes = beneficiaryEntity.visitProposes
        ..status = beneficiaryEntity.status
        ..specifyForwardedService = beneficiaryEntity.specifyForwardedService
        ..createdAt = beneficiaryEntity.createdAt
        ..updatedAt = beneficiaryEntity.updatedAt;

  static Beneficiary fromGraphql(Map<String, dynamic> graphql) => Beneficiary()
    ..fullName = graphql['fullName'] ?? ""
    ..biosp.value = GetIt.I<Isar>().biosps.where().findFirstSync()
    ..ulid = Inject.toUppercase(graphql['ulid'])
    ..genre.value = GetIt.I<Isar>()
        .genres
        .filter()
        .ulidEqualTo(GenreDto.fromGraphql(graphql['genre']).ulid)
        .findFirstSync()
    ..birthDate = DateTime.parse(graphql['birth_date'])
    ..serviceDate = DateTime.parse(graphql['service_date'])
    ..dateReceived = DateTime.parse(graphql['date_received'])
    ..provenance.value = GetIt.I<Isar>()
        .provenances
        .filter()
        .ulidEqualTo(ProvenanceDto.fromGraphql(graphql['provenance']).ulid)
        .findFirstSync()
    ..reasonOfOpeningCase.value = GetIt.I<Isar>()
        .reasonOfOpeningCases
        .filter()
        .ulidEqualTo(
            ReasonOfOpeningCaseDto.fromGraphql(graphql['reason_opening_case'])
                .ulid)
        .findFirstSync()
    ..documentType.value = GetIt.I<Isar>()
        .documentTypes
        .filter()
        .ulidEqualTo(DocumentTypeDto.fromGraphql(graphql['document_type']).ulid)
        .findFirstSync()
    ..otherDocumentType = graphql['other_document_type'] ?? ""
    ..forwardedService.value = GetIt.I<Isar>()
        .forwardedServices
        .filter()
        .ulidEqualTo(
            ForwardedServiceDto.fromGraphql(graphql['forwarded_service']).ulid)
        .findFirstSync()
    ..otherForwardedService = graphql['other_forwarded_service'] ?? ""
    ..purposeOfVisit.value = GetIt.I<Isar>()
        .purposeOfVisits
        .filter()
        .ulidEqualTo(
            PurposeOfVisitDto.fromGraphql(graphql['purpose_of_visit']).ulid)
        .findFirstSync()
    ..otherReasonOfOpeningCase = graphql['other_reason_of_opening_case'] ?? ""
    ..homeCare = bool.fromEnvironment(graphql['home_care'])
    ..numberOfVisits = int.parse(graphql['number_of_visits'])
    ..phone = graphql['phone'] ?? ""
    ..specifyPurposeOfVisit = graphql['specify_purpose_of_visit'] ?? ""
    ..specifyForwardedService = graphql['specify_forwarded_service'] ?? ""
    ..visitProposes = graphql['visit_proposes'] ?? ""
    ..status = bool.fromEnvironment(graphql['status'])
    ..createdAt = DateTime.parse(graphql['created_at'])
    ..updatedAt = DateTime.parse(graphql['updated_at']);
}
