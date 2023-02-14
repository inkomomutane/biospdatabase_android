import 'package:biosp/data/datasource/isar/datasource/create_beneficiary_datasource.dart';
import 'package:biosp/data/datasource/isar/datasource/get_all_beneficiaries_datasource.dart';
import 'package:biosp/data/datasource/isar/datasource/internal/create_biosp_datasource.dart';
import 'package:biosp/data/datasource/isar/datasource/internal/create_document_type_datasource.dart';
import 'package:biosp/data/datasource/isar/datasource/internal/create_forwarded_service_datasource.dart';
import 'package:biosp/data/datasource/isar/datasource/internal/create_genre_datasource.dart';
import 'package:biosp/data/datasource/isar/datasource/internal/create_provenance_datasource.dart';
import 'package:biosp/data/datasource/isar/datasource/internal/create_purpose_of_visit_datasource.dart';
import 'package:biosp/data/datasource/isar/datasource/internal/create_reason_of_opening_case_datasource.dart';
import 'package:biosp/domain/entity/beneficiaries/beneficiary_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:ulid4d/ulid4d.dart';

import '../../../core/testing_inject.dart';
import '../../../helpers/helpers.dart';

void main() {

  TestingInject.init();
  late BeneficiaryEntity beneficiaryEntity;
  setUp(() async {
    await Isar.initializeIsarCore();
    beneficiaryEntity = beneficiaryEntityTestTrait().copyWith(ulid: ULID.nextULID());

    await  GetIt.I<Isar>().writeTxn(() async {
      await  GetIt.I<Isar>().clear();
    });

    await CreateBiospDatasource( GetIt.I<Isar>())(biospEntity);
    await CreateDocumentTypeDatasource( GetIt.I<Isar>())(documentTypeEntity);
    await CreateForwardedServiceDatasource( GetIt.I<Isar>())(forwardedServiceEntity);
    await CreateGenreDatasource( GetIt.I<Isar>())(genreEntity);
    await CreateProvenanceDatasource( GetIt.I<Isar>())(provenanceEntity);
    await CreatePurposeOfVisitDatasource( GetIt.I<Isar>())(purposeOfVisitEntity);
    await CreateReasonOfOpeningCaseDatasource( GetIt.I<Isar>())(reasonOfOpeningCaseEntity);

    await CreateBeneficiaryDatasource( GetIt.I<Isar>())(beneficiaryEntity);
  });

  tearDown(() {
    GetIt.I<Isar>().writeTxn(() async {
      await  GetIt.I<Isar>().clear();
    });
  });

  test('it should read all beneficiaries from isar database', () async {
    var result = await GetAllBeneficiariesDatasource( GetIt.I<Isar>())();
    result.fold((l) => expect(l, ''), (r) {
      expect(r.contains(beneficiaryEntity),true);
    });
  });
}
