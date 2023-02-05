import 'package:biosp/data/datasource/isar/datasource/internal/store_auth_datasource.dart';
import 'package:biosp/data/datasource/isar/model/auth/auth.dart';
import 'package:biosp/data/dto/auth/auth_dto.dart';
import 'package:biosp/domain/entity/auth/auth_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';

import '../../../../core/testing_inject.dart';


void main() {
TestingInject.init();
  late AuthEntity authEntity;
  setUp(() async {
    await Isar.initializeIsarCore();
    authEntity = const AuthEntity(
      name: 'Mutas',
      email: 'test@test.com',
      token: 'shgdshgdhsvdghsgd',
    );
  });

  test(
      'it should store and updating existing auth credentials from isar database',
      () async {
    await StoreAuthDatasource( GetIt.I<Isar>())(authEntity);
    var result = await StoreAuthDatasource( GetIt.I<Isar>())(authEntity);
    result.fold((l) => expect(l, ''), (r) async {
      AuthEntity authIsar = authEntity.copyWith(id: 1);
      var auth = await  GetIt.I<Isar>()
          .txn(() async => AuthDto.fromIsar((await  GetIt.I<Isar>().auths.get(1))));

      expect(auth, authIsar);
    });
  });
}
