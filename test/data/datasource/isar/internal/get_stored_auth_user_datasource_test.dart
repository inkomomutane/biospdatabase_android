import 'package:biosp/core/error_handler.dart';
import 'package:biosp/data/datasource/isar/datasource/internal/get_auth_user_datasource.dart';
import 'package:biosp/data/datasource/isar/datasource/internal/store_auth_datasource.dart';
import 'package:biosp/data/datasource/isar/model/auth/auth.dart';
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
        email: 'email@test.com',
        name: 'Task',
        token: 'jkhskjsvgskdgvskdv',
        id: 1);
    await StoreAuthDatasource( GetIt.I<Isar>())(authEntity);
  });

  test('it should read auth user from isar database', () async {
    var result = await GetAuthUserDatasource( GetIt.I<Isar>())();
    result.fold((l) => expect(l, ''), (r) {
      expect(r, authEntity);
    });
  });
}
