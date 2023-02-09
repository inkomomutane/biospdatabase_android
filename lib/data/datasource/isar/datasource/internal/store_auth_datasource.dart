import '../../../../../core/error_handler.dart';
import '../../model/auth/auth.dart';
import '../../../../dto/auth/auth_dto.dart';
import '../../../../../domain/entity/auth/auth_entity.dart';
import 'package:flutter/widgets.dart';
import 'package:fpdart/fpdart.dart';
import 'package:isar/isar.dart';

class StoreAuthDatasource {
  final Isar _isar;
  StoreAuthDatasource(this._isar);
  Future<ErrorHandler<int>> call(AuthEntity authEntity) {
    try {
      return Future(() => right(_isar.writeTxnSync(
          () => _isar.auths.putSync(AuthDto.fromEntity(authEntity)))));
    } on Exception catch (_, s) {
      return Future(() => left(s.toString()));
    }
  }
}
