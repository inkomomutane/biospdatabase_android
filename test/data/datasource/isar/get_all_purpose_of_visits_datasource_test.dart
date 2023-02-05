import 'package:biosp/data/datasource/isar/datasource/get_all_purpose_of_visit_datasource.dart';
import 'package:biosp/data/datasource/isar/datasource/internal/create_purpose_of_visit_datasource.dart';

import 'package:biosp/data/datasource/isar/model/purposes_of_visit/purpose_of_visit.dart';
import 'package:biosp/domain/entity/purposes_of_visit/purpose_of_visit_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:ulid4d/ulid4d.dart';

import '../../../core/testing_inject.dart';


void main() {
  TestingInject.init();
  late ULID ulid;
  late PurposeOfVisitEntity purposeOfVisitEntity;
  setUp(() async {
    await Isar.initializeIsarCore();
    ulid = ULID.nextULID();
    purposeOfVisitEntity =
        PurposeOfVisitEntity(ulid: ulid, name: 'purposeOfVisit', id: 1);
    await CreatePurposeOfVisitDatasource( GetIt.I<Isar>())(purposeOfVisitEntity);
  });

  tearDown(() {
    GetIt.I<Isar>().writeTxn(() async => await  GetIt.I<Isar>().purposeOfVisits.clear());
  });

  test('it should read all purposes of visit from isar database', () async {
    var result = await GetAllPurposeOfVisitsDatasource( GetIt.I<Isar>())();
    result.fold((l) => expect(l, ''), (r) {
      expect(r.contains(purposeOfVisitEntity), true);
    });
  });
}
