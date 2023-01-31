import 'package:biosp/data/datasource/isar/datasource/internal/create_forwarded_service_datasource.dart';
import 'package:biosp/data/datasource/isar/model/forwarded_services/forwarded_service.dart';
import 'package:biosp/data/dto/forwarded_services/forwarded_service_dto.dart';
import 'package:biosp/domain/entity/forwarded_services/forwarded_service_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:ulid4d/ulid4d.dart';


void main() {
  late Isar isar;
  late ULID ulid;
  late ForwardedServiceEntity forwardedServiceEntity;
  setUp(() async {
    await Isar.initializeIsarCore();
    isar = await Isar.open([ForwardedServiceSchema]);
    ulid = ULID.nextULID();
    forwardedServiceEntity = ForwardedServiceEntity(ulid: ulid, name: 'biosp');
  });

  tearDown(() {
    isar.writeTxn(() async => await isar.forwardedServices.clear());
  });

  test('it should create  forwarded service from isar database', () async {
    var result = await CreateForwardedServiceDatasource(isar)(forwardedServiceEntity);
    result.fold((l) => expect(l, ''), (r) async {
      ForwardedServiceEntity forwardedServiceIsar = forwardedServiceEntity.copyWith(id: r);
      var forwardedService = await isar.txn(() async =>
          ForwardedServiceDto.fromIsar((await isar.forwardedServices.get(1))));
      expect(forwardedService, forwardedServiceIsar);
    });
  });
}
