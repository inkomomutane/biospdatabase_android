import 'package:biosp/data/datasource/isar/datasource/internal/create_forwarded_service_datasource.dart';
import 'package:biosp/data/datasource/isar/model/forwarded_services/forwarded_service.dart';
import 'package:biosp/data/dto/forwarded_services/forwarded_service_dto.dart';
import 'package:biosp/domain/entity/forwarded_services/forwarded_service_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:ulid4d/ulid4d.dart';

import '../../../../core/testing_inject.dart';


void main() {
TestingInject.init();
  late ULID ulid;
  late ForwardedServiceEntity forwardedServiceEntity;
  setUp(() async {
    await Isar.initializeIsarCore();
    ulid = ULID.nextULID();
    forwardedServiceEntity = ForwardedServiceEntity(ulid: ulid, name: 'biosp');
  });

  tearDown(() {
    GetIt.I<Isar>().writeTxn(() async => await  GetIt.I<Isar>().forwardedServices.clear());
  });

  test('it should create  forwarded service from isar database', () async {
    var result = await CreateForwardedServiceDatasource( GetIt.I<Isar>())(forwardedServiceEntity);
    result.fold((l) => expect(l, ''), (r) async {
      ForwardedServiceEntity forwardedServiceIsar = forwardedServiceEntity.copyWith(id: r);
      var forwardedService = await  GetIt.I<Isar>().txn(() async =>
          ForwardedServiceDto.fromIsar((await  GetIt.I<Isar>().forwardedServices.get(1))));
      expect(forwardedService, forwardedServiceIsar);
    });
  });
}
