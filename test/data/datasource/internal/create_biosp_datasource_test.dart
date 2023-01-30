import 'package:biosp/data/datasource/isar/datasource/internal/create_biosp_datasource.dart';
import 'package:biosp/data/datasource/isar/model/biosps/biosp.dart';
import 'package:biosp/data/dto/biosps/biosp_dto.dart';
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
    biospEntity = BiospEntity(ulid: ulid, name: 'biosp',projectName: 'akulo');
  });

  tearDown(() {
    isar.writeTxn(() async => await isar.biosps.clear());
  });

  test('it should create biosp entity from isar database', () async {
    var result = await CreateBiospDatasource(isar)(biospEntity);
    result.fold((l)  => expect(l,''), (r) async {
      BiospEntity biospIsar = biospEntity.copyWith(id: r);
      var biosp = await isar
          .txn(() async => BiospDto.fromIsar((await isar.biosps.get(1))));
      expect(biosp, biospIsar);
    });
  });
}