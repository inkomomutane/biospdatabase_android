import 'package:biosp/data/datasource/isar/datasource/internal/create_reason_of_opening_case_datasource.dart';
import 'package:biosp/data/datasource/isar/model/reasons_of_opening_case/reason_of_opening_case.dart';
import 'package:biosp/data/dto/reasons_of_opening_cases/reasons_of_opening_case_dto.dart';
import 'package:biosp/domain/entity/reasons_of_opening_case/reason_of_opening_case_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:ulid4d/ulid4d.dart';

void main() {
  late Isar isar;
  late ULID ulid;
  late ReasonOfOpeningCaseEntity reasonOfOpeningCaseEntity;
  setUp(() async {
    await Isar.initializeIsarCore();
    isar = await Isar.open([ReasonOfOpeningCaseSchema]);
    ulid = ULID.nextULID();
    reasonOfOpeningCaseEntity = ReasonOfOpeningCaseEntity(ulid: ulid, name: 'biosp');
  });

  tearDown(() {
    isar.writeTxn(() async => await isar.reasonOfOpeningCases.clear());
  });

  test('it should create reason of opening case from isar database', () async {
    var result = await CreateReasonOfOpeningCaseDatasource(isar)(reasonOfOpeningCaseEntity);
    result.fold((l) => expect(l, ''), (r) async {
      ReasonOfOpeningCaseEntity reasonOfOpeningCaseIsar = reasonOfOpeningCaseEntity.copyWith(id: r);
      var reasonOfOpeningCase = await isar.txn(() async =>
          ReasonOfOpeningCaseDto.fromIsar((await isar.reasonOfOpeningCases.get(1))));
      expect(reasonOfOpeningCase, reasonOfOpeningCaseIsar);
    });
  });
}
