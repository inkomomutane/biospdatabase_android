import 'package:biosp/data/datasource/isar/datasource/internal/store_auth_datasource.dart';
import 'package:biosp/data/datasource/isar/model/auth/auth.dart';
import 'package:biosp/data/dto/auth/auth_dto.dart';
import 'package:biosp/domain/entity/auth/auth_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';


void main() {
  late Isar isar;
  late AuthEntity authEntity;
  setUp(() async {
    await Isar.initializeIsarCore();
    isar = await Isar.open([AuthSchema]);
    authEntity = const AuthEntity(
      name: 'Mutas',
      email: 'test@test.com',
      token: 'shgdshgdhsvdghsgd',
    );
  });

  test(
      'it should store and updating existing auth credentials from isar database',
      () async {
    await StoreAuthDatasource(isar)(authEntity);
    var result = await StoreAuthDatasource(isar)(authEntity);
    result.fold((l) => expect(l, ''), (r) async {
      AuthEntity authIsar = authEntity.copyWith(id: 1);
      var auth = await isar
          .txn(() async => AuthDto.fromIsar((await isar.auths.get(1))));

      expect(auth, authIsar);
    });
  });
}
