import '../../model/auth/auth.dart';
import '../../../../../domain/repository/get_stored_auth_user_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:isar/isar.dart';

import '../../../../../core/error_handler.dart';
import '../../../../../domain/entity/auth/auth_entity.dart';
import '../../../../dto/auth/auth_dto.dart';

class GetAuthUserDatasource implements GetAuthUserRepository {
  final Isar _isar;
  GetAuthUserDatasource(this._isar);

  @override
  Future<ErrorHandler<AuthEntity>> call() {
    try {
      return Future(() =>
          right(_isar.txnSync(() => AuthDto.fromIsar(_isar.auths.getSync(1)))));
    } on Exception catch (_, e) {
      return Future(() => left(e.toString()));
    }
  }
}
