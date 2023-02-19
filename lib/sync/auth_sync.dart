import 'package:fpdart/fpdart.dart';
import 'package:isar/isar.dart';

import '../bloc/components/views/auth/login_state.dart';
import '../core/error_handler.dart';
import '../data/datasource/graphql/login_datasource.dart';
import '../data/datasource/isar/datasource/internal/store_auth_datasource.dart';
import '../data/dto/auth/auth_dto.dart';
import '../translations/locale_keys.g.dart';

class AuthSync {
  final Isar _isar;
  AuthSync(this._isar);
  Future<ErrorHandler<bool>> call(LoginState loginState) async {
    var result = await GetAuthUserGraphqlDatasource()(loginState);
    return result.fold((l) => left(l), (r) async {
      return (await StoreAuthDatasource(_isar)(AuthDto.fromIsar(r)))
          .fold((l) => left(LocaleKeys.authFailed), (r) => right(true));
    });
  }
}
