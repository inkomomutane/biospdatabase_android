import 'package:biosp/domain/entity/beneficiaries/beneficiary_entity.dart';
import 'package:biosp/domain/entity/biosps/biosp_entity.dart';
import 'package:biosp/domain/entity/document_types/document_type_entity.dart';
import 'package:biosp/domain/entity/forwarded_services/forwarded_service_entity.dart';
import 'package:biosp/domain/entity/genres/genre_entity.dart';
import 'package:biosp/domain/entity/provenances/provenance_entity.dart';
import 'package:biosp/domain/entity/purposes_of_visit/purpose_of_visit_entity.dart';
import 'package:biosp/domain/entity/reasons_of_opening_case/reason_of_opening_case_entity.dart';
import 'package:ulid4d/ulid4d.dart';

final BiospEntity biospEntity = BiospEntity(
  ulid: ULID.nextULID(),
  name: 'Maputo',
  projectName: 'Akulo-Akulo',
);
 final ULID ulid = ULID.nextULID();
 const String fullName = "Jane Doe";
 const int numberOfVisits = 2;
 final DateTime birthDate = DateTime.now();
 const String phone = "+258847607095";
 final DateTime serviceDate = DateTime.now();
 const bool homeCare = false;
 final DateTime dateReceived = DateTime.now();
 final GenreEntity genreEntity = GenreEntity(ulid: ULID.nextULID(), name: 'Male');
 final ProvenanceEntity provenanceEntity =
 ProvenanceEntity(ulid: ULID.nextULID(), name: 'Community');
 final ReasonOfOpeningCaseEntity reasonOfOpeningCaseEntity =
 ReasonOfOpeningCaseEntity(ulid: ULID.nextULID(), name: 'Bring ID');
 const String otherReasonOfOpeningCase = "";
 final DocumentTypeEntity documentTypeEntity = DocumentTypeEntity(ulid: ULID.nextULID(), name: 'ID');
 const String otherDocumentType = "";
 final ForwardedServiceEntity forwardedServiceEntity =
 ForwardedServiceEntity(ulid: ULID.nextULID(), name: 'DIC');
 const String otherForwardedService = "";
 final PurposeOfVisitEntity purposeOfVisitEntity =
 PurposeOfVisitEntity(ulid: ULID.nextULID(), name: 'ID');
 const String specifyPurposeOfVisit = "";
 const String visitProposes = "";
 const bool status = false;

BeneficiaryEntity beneficiaryEntityTestTrait(){
  return BeneficiaryEntity(
    biospEntity : biospEntity,
    ulid: ulid,
    fullName: fullName,
    genreEntity: genreEntity,
    numberOfVisits: numberOfVisits,
    birthDate: birthDate,
    phone: phone,
    serviceDate: serviceDate,
    homeCare: homeCare,
    dateReceived: dateReceived,
    provenanceEntity: provenanceEntity,
    reasonOfOpeningCaseEntity: reasonOfOpeningCaseEntity,
    otherReasonOfOpeningCase: otherReasonOfOpeningCase,
    documentTypeEntity: documentTypeEntity,
    otherDocumentType: otherDocumentType,
    forwardedServiceEntity: forwardedServiceEntity,
    otherForwardedService: otherForwardedService,
    purposeOfVisitEntity: purposeOfVisitEntity,
    specifyPurposeOfVisit: specifyPurposeOfVisit,
    visitProposes: visitProposes,
    status: status,
  );
}

List<BeneficiaryEntity> listOfBeneficiaryEntityTestTrait(){
  return [beneficiaryEntityTestTrait()];
}



