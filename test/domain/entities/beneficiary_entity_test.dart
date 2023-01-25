import 'package:biosp/domain/entity/beneficiaries/beneficiary_entity.dart';
import 'package:biosp/domain/entity/biosps/biosp_entity.dart';
import 'package:biosp/domain/entity/document_types/document_type_entity.dart';
import 'package:biosp/domain/entity/forwarded_services/forwarded_service_entity.dart';
import 'package:biosp/domain/entity/genres/genre_entity.dart';
import 'package:biosp/domain/entity/provenances/provenance_entity.dart';
import 'package:biosp/domain/entity/purposes_of_visit/purpose_of_visit_entity.dart';
import 'package:biosp/domain/entity/reasons_of_opening_case/reason_of_opening_case_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ulid4d/ulid4d.dart';

import '../../helpers/helpers.dart';

void main() {
  late final BeneficiaryEntity beneficiaryEntity;
  setUp(() {
    beneficiaryEntity = beneficiaryEntityTestTrait();
  });

  test('it should create an beneficiary entity', () {
    expect(beneficiaryEntity.ulid.toString(), ulid.toString());
    expect(beneficiaryEntity.fullName,fullName);
    expect(beneficiaryEntity.biospEntity == biospEntity, true);
    expect(beneficiaryEntity.genreEntity == genreEntity, true);
    expect(beneficiaryEntity.numberOfVisits,numberOfVisits);
    expect(beneficiaryEntity.birthDate,birthDate);
    expect(beneficiaryEntity.phone,phone);
    expect(beneficiaryEntity.serviceDate,serviceDate);
    expect(beneficiaryEntity.homeCare,homeCare);
    expect(beneficiaryEntity.dateReceived,dateReceived);
    expect(beneficiaryEntity.provenanceEntity == provenanceEntity, true);
    expect(beneficiaryEntity.reasonOfOpeningCaseEntity == reasonOfOpeningCaseEntity, true);
    expect(beneficiaryEntity.otherReasonOfOpeningCase,otherReasonOfOpeningCase);
    expect(beneficiaryEntity.documentTypeEntity == documentTypeEntity, true);
    expect(beneficiaryEntity.otherDocumentType,otherDocumentType);
    expect(beneficiaryEntity.forwardedServiceEntity == forwardedServiceEntity, true);
    expect(beneficiaryEntity.otherForwardedService,otherForwardedService);
    expect(beneficiaryEntity.purposeOfVisitEntity == purposeOfVisitEntity, true);
    expect(beneficiaryEntity.specifyPurposeOfVisit,specifyPurposeOfVisit);
    expect(beneficiaryEntity.visitProposes,visitProposes);
    expect(beneficiaryEntity.status,status);
  });
}
