import 'package:biosp/data/datasource/isar/datasource/create_beneficiary_datasource.dart';
import 'package:biosp/data/datasource/isar/datasource/get_all_beneficiaries_datasource.dart';
import 'package:biosp/data/datasource/isar/model/beneficiaries/beneficiary.dart';
import 'package:biosp/data/datasource/isar/model/biosps/biosp.dart';
import 'package:biosp/data/datasource/isar/model/document_types/document_type.dart';
import 'package:biosp/data/datasource/isar/model/forwarded_services/forwarded_service.dart';
import 'package:biosp/data/datasource/isar/model/genres/genre.dart';
import 'package:biosp/data/datasource/isar/model/provenances/provenance.dart';
import 'package:biosp/data/datasource/isar/model/purposes_of_visit/purpose_of_visit.dart';
import 'package:biosp/data/datasource/isar/model/reasons_of_opening_case/reason_of_opening_case.dart';
import 'package:biosp/domain/entity/beneficiaries/beneficiary_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';

import '../../helpers/helpers.dart';

void main() {
  
  late Isar isar;

  late BeneficiaryEntity beneficiaryEntity;
  setUp(() async {
    await Isar.initializeIsarCore();
    isar = await Isar.open([
       BeneficiarySchema,
      BiospSchema,
      DocumentTypeSchema,
      ForwardedServiceSchema,
      GenreSchema,
      ProvenanceSchema,
      PurposeOfVisitSchema,
      ReasonOfOpeningCaseSchema,
    ]);

    beneficiaryEntity = beneficiaryEntityTestTrait();
    await CreateBeneficiaryDatasource(isar)(beneficiaryEntity);
  });

  tearDown(() {
    isar.writeTxn(() async => await isar.beneficiaries.clear());
  });

  test('it should read all beneficiaries from isar database', () async {
    var result = await GetAllBeneficiariesDatasource(isar)();
    result.fold((l) => expect(l, ''), (r) {
      expect(r, [beneficiaryEntity]);
    });
  });
}
