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
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';

import '../../../core/testing_inject.dart';
import '../../../helpers/helpers.dart';

void main() async {
  TestingInject.init();
  late BeneficiaryEntity beneficiaryEntity;

  setUp(() async {
    await Isar.initializeIsarCore();
    beneficiaryEntity = beneficiaryEntityTestTrait();
  });

  tearDown(() async {
    GetIt.I<Isar>().writeTxn(() async => await  GetIt.I<Isar>().beneficiaries.clear());
  });

  test('it should create beneficiary from isar database', () async {
    var result = await CreateBeneficiaryDatasource( GetIt.I<Isar>())(beneficiaryEntity);
    result.fold((l) => expect(l, ''), (r) async {
      BeneficiaryEntity beneficiaryIsar = beneficiaryEntity.copyWith(id: r);
      var beneficiary = await  GetIt.I<Isar>().txn(() async =>
          BeneficiaryDto.fromIsar((await  GetIt.I<Isar>().beneficiaries.get(1))));
      expect(beneficiary, beneficiaryIsar);
    });
  });
}
