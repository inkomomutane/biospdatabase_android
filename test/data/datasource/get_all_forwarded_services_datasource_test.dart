import 'package:biosp/data/datasource/isar/datasource/get_all_forwarded_services_datasource.dart';
import 'package:biosp/data/datasource/isar/datasource/internal/create_forwarded_service_datasource.dart';
import 'package:biosp/data/datasource/isar/model/forwarded_services/forwarded_service.dart';
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
    forwardedServiceEntity =
        ForwardedServiceEntity(ulid: ulid, name: 'forwardedService', id: 1);
    await CreateForwardedServiceDatasource(isar)(forwardedServiceEntity);
  });

  tearDown(() {
    isar.writeTxn(() async => await isar.forwardedServices.clear());
  });

  test('it should read all forwarded services from isar database', () async {
    var result = await GetAllForwardedServicesDatasource(isar)();
    result.fold((l) => expect(l, ''), (r) {
      expect(r, [forwardedServiceEntity]);
    });
  });
}
