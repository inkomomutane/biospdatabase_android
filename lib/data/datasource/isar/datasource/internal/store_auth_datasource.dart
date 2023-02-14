import 'package:fpdart/fpdart.dart';
import 'package:isar/isar.dart';

import '../../../../../core/error_handler.dart';
import '../../../../../domain/entity/auth/auth_entity.dart';
import '../../../../dto/auth/auth_dto.dart';
import '../../model/auth/auth.dart';

class StoreAuthDatasource {
  final Isar _isar;
  StoreAuthDatasource(this._isar);
  Future<ErrorHandler<int>> call(AuthEntity authEntity) async {
    try {
      return right(
        _isar.writeTxnSync(
          () => _isar.auths.putSync(
            AuthDto.fromEntity(authEntity),
          ),
        ),
      );
    } on Exception catch (_, s) {
      return left(s.toString());
    }
  }
}
