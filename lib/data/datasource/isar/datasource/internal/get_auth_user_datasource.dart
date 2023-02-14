import 'package:fpdart/fpdart.dart';
import 'package:isar/isar.dart';

import '../../../../../core/error_handler.dart';
import '../../../../../domain/entity/auth/auth_entity.dart';
import '../../../../../domain/repository/get_stored_auth_user_repository.dart';
import '../../../../dto/auth/auth_dto.dart';
import '../../model/auth/auth.dart';

class GetAuthUserDatasource implements GetAuthUserRepository {
  final Isar _isar;
  GetAuthUserDatasource(this._isar);

  @override
  Future<ErrorHandler<AuthEntity>> call() async {
    try {
      return right(
        _isar.txnSync(
          () => AuthDto.fromIsar(
            _isar.auths.getSync(1),
          ),
        ),
      );
    } on Exception catch (_, e) {
      return left(e.toString());
    }
  }
}
