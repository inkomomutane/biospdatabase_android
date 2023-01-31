import 'package:biosp/data/datasource/isar/datasource/create_beneficiary_datasource.dart';
import 'package:biosp/data/datasource/isar/model/beneficiaries/beneficiary.dart';
import 'package:biosp/data/datasource/isar/model/biosps/biosp.dart';
import 'package:biosp/data/datasource/isar/model/document_types/document_type.dart';
import 'package:biosp/data/datasource/isar/model/forwarded_services/forwarded_service.dart';
import 'package:biosp/data/datasource/isar/model/genres/genre.dart';
import 'package:biosp/data/datasource/isar/model/provenances/provenance.dart';
import 'package:biosp/data/datasource/isar/model/purposes_of_visit/purpose_of_visit.dart';
import 'package:biosp/data/datasource/isar/model/reasons_of_opening_case/reason_of_opening_case.dart';
import 'package:biosp/data/dto/beneficiaries/beneficiary_dto.dart';
import 'package:biosp/domain/entity/beneficiaries/beneficiary_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';

import '../../helpers/helpers.dart';

void main() async {
  late Isar isar;
  late BeneficiaryEntity beneficiaryEntity;

  setUp(() async {
    await Isar.initializeIsarCore();
    isar  = (await Isar.open([
      BeneficiarySchema,
      BiospSchema,
      DocumentTypeSchema,
      ForwardedServiceSchema,
      GenreSchema,
      ProvenanceSchema,
      PurposeOfVisitSchema,
      ReasonOfOpeningCaseSchema,
    ]));
    beneficiaryEntity = beneficiaryEntityTestTrait();
  });

  tearDown(() async {
    isar.writeTxn(() async => await isar.beneficiaries.clear());
  });

  test('it should create beneficiary from isar database', () async {
    var result = await CreateBeneficiaryDatasource(isar)(beneficiaryEntity);
    result.fold((l) => expect(l, ''), (r) async {
      BeneficiaryEntity beneficiaryIsar = beneficiaryEntity.copyWith(id: r);
      var beneficiary = await isar.txn(() async =>
          BeneficiaryDto.fromIsar((await isar.beneficiaries.get(1))));
      expect(beneficiary, beneficiaryIsar);
    });
  });
}
