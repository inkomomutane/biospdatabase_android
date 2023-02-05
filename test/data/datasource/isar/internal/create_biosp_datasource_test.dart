import 'package:biosp/data/datasource/isar/datasource/internal/create_biosp_datasource.dart';
import 'package:biosp/data/datasource/isar/model/biosps/biosp.dart';
import 'package:biosp/data/dto/biosps/biosp_dto.dart';
import 'package:biosp/domain/entity/biosps/biosp_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:ulid4d/ulid4d.dart';

import '../../../../core/testing_inject.dart';


void main() {
TestingInject.init();
  late ULID ulid;
  late BiospEntity biospEntity;
  setUp(() async {
    await Isar.initializeIsarCore();
    ulid = ULID.nextULID();
    biospEntity = BiospEntity(ulid: ulid, name: 'biosp',projectName: 'akulo');
  });

  tearDown(() {
    GetIt.I<Isar>().writeTxn(() async => await  GetIt.I<Isar>().biosps.clear());
  });

  test('it should create biosp entity from isar database', () async {
    var result = await CreateBiospDatasource( GetIt.I<Isar>())(biospEntity);
    result.fold((l)  => expect(l,''), (r) async {
      BiospEntity biospIsar = biospEntity.copyWith(id: r);
      var biosp = await  GetIt.I<Isar>()
          .txn(() async => BiospDto.fromIsar((await  GetIt.I<Isar>().biosps.get(1))));
      expect(biosp, biospIsar);
    });
  });
}