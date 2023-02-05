import 'package:biosp/data/datasource/isar/datasource/get_all_provenance_datasource.dart';
import 'package:biosp/data/datasource/isar/datasource/internal/create_provenance_datasource.dart';
import 'package:biosp/data/datasource/isar/model/provenances/provenance.dart';
import 'package:biosp/domain/entity/provenances/provenance_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:ulid4d/ulid4d.dart';

import '../../../core/testing_inject.dart';

void main() {
TestingInject.init();

  late ULID ulid;
  late ProvenanceEntity provenanceEntity;
  setUp(() async {
    await Isar.initializeIsarCore();

    ulid = ULID.nextULID();
    provenanceEntity = ProvenanceEntity(ulid: ulid, name: 'provenance',id: 1);
    await CreateProvenanceDatasource( GetIt.I<Isar>())(provenanceEntity);
  });

  tearDown(() {
    GetIt.I<Isar>().writeTxn(() async => await  GetIt.I<Isar>().provenances.clear());
  });

  test('it should read all provenances from isar database', () async {
    var result = await GetAllProvenancesDatasource( GetIt.I<Isar>())();
    result.fold((l) => expect(l, ''), (r){
      expect(r.contains(provenanceEntity), true);
    });
  });
}
