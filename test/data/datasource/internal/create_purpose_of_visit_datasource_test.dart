import 'package:biosp/data/datasource/isar/datasource/internal/create_purpose_of_visit_datasource.dart';
import 'package:biosp/data/datasource/isar/model/purposes_of_visit/purpose_of_visit.dart';
import 'package:biosp/data/dto/purpose_of_visits/purpose_of_visit_dto.dart';
import 'package:biosp/domain/entity/purposes_of_visit/purpose_of_visit_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:ulid4d/ulid4d.dart';


void main() {
  late Isar isar;
  late ULID ulid;
  late PurposeOfVisitEntity purposeOfVisitEntity;
  setUp(() async {
    await Isar.initializeIsarCore();
    isar = await Isar.open([PurposeOfVisitSchema]);
    ulid = ULID.nextULID();
    purposeOfVisitEntity = PurposeOfVisitEntity(ulid: ulid, name: 'biosp');
  });

  tearDown(() {
    isar.writeTxn(() async => await isar.purposeOfVisits.clear());
  });

  test('it should create purpose of visit from isar database', () async {
    var result = await CreatePurposeOfVisitDatasource(isar)(purposeOfVisitEntity);
    result.fold((l) => expect(l, ''), (r) async {
      PurposeOfVisitEntity purposeOfVisitIsar = purposeOfVisitEntity.copyWith(id: r);
      var purposeOfVisit = await isar.txn(() async =>
          PurposeOfVisitDto.fromIsar((await isar.purposeOfVisits.get(1))));
      expect(purposeOfVisit, purposeOfVisitIsar);
    });
  });
}
