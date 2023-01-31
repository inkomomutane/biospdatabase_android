import 'package:biosp/data/datasource/isar/datasource/get_all_provenance_datasource.dart';
import 'package:biosp/data/datasource/isar/datasource/internal/create_provenance_datasource.dart';
import 'package:biosp/data/datasource/isar/model/provenances/provenance.dart';
import 'package:biosp/domain/entity/provenances/provenance_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:ulid4d/ulid4d.dart';

void main() {
  late Isar isar;
  late ULID ulid;
  late ProvenanceEntity provenanceEntity;
  setUp(() async {
    await Isar.initializeIsarCore();
    isar = await Isar.open([ProvenanceSchema]);
    ulid = ULID.nextULID();
    provenanceEntity = ProvenanceEntity(ulid: ulid, name: 'provenance',id: 1);
    await CreateProvenanceDatasource(isar)(provenanceEntity);
  });

  tearDown(() {
    isar.writeTxn(() async => await isar.provenances.clear());
  });

  test('it should read all provenances from isar database', () async {
    var result = await GetAllProvenancesDatasource(isar)();
    result.fold((l) => expect(l, ''), (r){
      expect(r, [provenanceEntity]);
    });
  });
}
