import 'package:biosp/data/datasource/isar/datasource/get_all_reasons_of_opening_case_datasource.dart';
import 'package:biosp/data/datasource/isar/datasource/internal/create_reason_of_opening_case_datasource.dart';
import 'package:biosp/data/datasource/isar/model/reasons_of_opening_case/reason_of_opening_case.dart';
import 'package:biosp/domain/entity/reasons_of_opening_case/reason_of_opening_case_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:ulid4d/ulid4d.dart';

import '../../../core/testing_inject.dart';


void main() {
TestingInject.init();
  late ULID ulid;
  late ReasonOfOpeningCaseEntity reasonOfOpeningCaseEntity;
  setUp(() async {
    await Isar.initializeIsarCore();
    ulid = ULID.nextULID();
    reasonOfOpeningCaseEntity =
        ReasonOfOpeningCaseEntity(ulid: ulid, name: 'reasonOfOpeningCase', id: 1);
    await CreateReasonOfOpeningCaseDatasource(GetIt.I<Isar>())(reasonOfOpeningCaseEntity);
  });

  tearDown(() {
    GetIt.I<Isar>().writeTxn(() async => await  GetIt.I<Isar>().reasonOfOpeningCases.clear());
  });

  test('it should read all reasons of opening cases from isar database', () async {
    var result = await GetAllReasonOfOpeningCasesDatasource( GetIt.I<Isar>())();
    result.fold((l) => expect(l, ''), (r) {
      expect(r.contains(reasonOfOpeningCaseEntity), true);
    });
  });
}
