import 'package:biosp/data/datasource/isar/datasource/get_all_forwarded_services_datasource.dart';
import 'package:biosp/data/datasource/isar/datasource/internal/create_forwarded_service_datasource.dart';
import 'package:biosp/data/datasource/isar/model/forwarded_services/forwarded_service.dart';
import 'package:biosp/domain/entity/forwarded_services/forwarded_service_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:ulid4d/ulid4d.dart';

import '../../../core/testing_inject.dart';


void main() {
TestingInject.init();
  late ULID ulid;
  late ForwardedServiceEntity forwardedServiceEntity;
  setUp(() async {
    await Isar.initializeIsarCore();
    ulid = ULID.nextULID();
    forwardedServiceEntity =
        ForwardedServiceEntity(ulid: ulid, name: 'forwardedService', id: 1);
    await CreateForwardedServiceDatasource( GetIt.I<Isar>())(forwardedServiceEntity);
  });

  tearDown(() {
    GetIt.I<Isar>().writeTxn(() async => await  GetIt.I<Isar>().forwardedServices.clear());
  });

  test('it should read all forwarded services from isar database', () async {
    var result = await GetAllForwardedServicesDatasource(GetIt.I<Isar>())();
    result.fold((l) => expect(l, ''), (r) {
      expect(r.contains(forwardedServiceEntity), true);
    });
  });
}
