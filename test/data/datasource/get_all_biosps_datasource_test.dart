import 'package:biosp/data/datasource/isar/datasource/get_all_biosps_datasource.dart';
import 'package:biosp/data/datasource/isar/datasource/internal/create_biosp_datasource.dart';
import 'package:biosp/data/datasource/isar/model/biosps/biosp.dart';
import 'package:biosp/domain/entity/biosps/biosp_entity.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:ulid4d/ulid4d.dart';


void main() {
  late Isar isar;
  late ULID ulid;
  late BiospEntity biospEntity;
  setUp(() async {
    await Isar.initializeIsarCore();
    isar = await Isar.open([BiospSchema]);
    ulid = ULID.nextULID();
    biospEntity =
        BiospEntity(ulid: ulid, name: 'biosp', id: 1, projectName: 'akulo');
    await CreateBiospDatasource(isar)(biospEntity);
  });

  tearDown(() {
    isar.writeTxn(() async => await isar.biosps.clear());
  });

  test('it should read all biosps from isar database', () async {
    var result = await GetAllBiospsDatasource(isar)();
    result.fold((l) => expect(l, ''), (r) {
      expect(r, [biospEntity]);
    });
  });
}
