import 'package:biosp/data/datasource/isar/datasource/internal/create_reason_of_opening_case_datasource.dart';
import 'package:biosp/data/datasource/isar/model/reasons_of_opening_case/reason_of_opening_case.dart';
import 'package:biosp/data/dto/reasons_of_opening_cases/reasons_of_opening_case_dto.dart';
import 'package:biosp/domain/entity/reasons_of_opening_case/reason_of_opening_case_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:ulid4d/ulid4d.dart';

import '../../../../core/testing_inject.dart';

void main() {
  TestingInject.init();
  late ULID ulid;
  late ReasonOfOpeningCaseEntity reasonOfOpeningCaseEntity;
  setUp(() async {
    await Isar.initializeIsarCore();
    ulid = ULID.nextULID();
    reasonOfOpeningCaseEntity = ReasonOfOpeningCaseEntity(ulid: ulid, name: 'biosp');
  });

  tearDown(() {
    GetIt.I<Isar>().writeTxn(() async => await  GetIt.I<Isar>().reasonOfOpeningCases.clear());
  });

  test('it should create reason of opening case from isar database', () async {
    var result = await CreateReasonOfOpeningCaseDatasource( GetIt.I<Isar>())(reasonOfOpeningCaseEntity);
    result.fold((l) => expect(l, ''), (r) async {
      ReasonOfOpeningCaseEntity reasonOfOpeningCaseIsar = reasonOfOpeningCaseEntity.copyWith(id: r);
      var reasonOfOpeningCase = await  GetIt.I<Isar>().txn(() async =>
          ReasonOfOpeningCaseDto.fromIsar((await  GetIt.I<Isar>().reasonOfOpeningCases.get(1))));
      expect(reasonOfOpeningCase, reasonOfOpeningCaseIsar);
    });
  });
}
