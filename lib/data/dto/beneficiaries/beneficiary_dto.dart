import 'package:ulid4d/ulid4d.dart';

import '../../../domain/entity/beneficiaries/beneficiary_entity.dart';
import '../../datasource/isar/model/beneficiaries/beneficiary.dart';
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
        ..id = beneficiaryEntity.id;
}
