import 'package:biosp/data/datasource/isar/datasource/get_all_biosps_datasource.dart';
import 'package:biosp/data/datasource/isar/datasource/internal/create_biosp_datasource.dart';
import 'package:biosp/data/datasource/isar/model/biosps/biosp.dart';
import 'package:biosp/domain/entity/biosps/biosp_entity.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:ulid4d/ulid4d.dart';

import '../../../core/testing_inject.dart';


void main() {
TestingInject.init();
  late ULID ulid;
  late BiospEntity biospEntity;
  setUp(() async {
    await Isar.initializeIsarCore();
    ulid = ULID.nextULID();
    biospEntity =
        BiospEntity(ulid: ulid, name: 'biosp', id: 1, projectName: 'akulo');
    await CreateBiospDatasource( GetIt.I<Isar>())(biospEntity);
  });

  tearDown(() {
    GetIt.I<Isar>().writeTxn(() async => await  GetIt.I<Isar>().biosps.clear());
  });

  test('it should read all biosps from isar database', () async {
    var result = await GetAllBiospsDatasource( GetIt.I<Isar>())();
    result.fold((l) => expect(l, ''), (r) {
      expect(r.contains(biospEntity), true);
    });
  });
}
