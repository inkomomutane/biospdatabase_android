import 'package:biosp/bloc/components/cubit/login_state.dart';
import 'package:biosp/core/error_handler.dart';
import 'package:biosp/data/datasource/graphql/login_datasource.dart';
import 'package:biosp/data/datasource/isar/datasource/internal/store_auth_datasource.dart';
import 'package:biosp/data/dto/auth/auth_dto.dart';
import 'package:biosp/translations/locale_keys.g.dart';
import 'package:fpdart/fpdart.dart';
import 'package:isar/isar.dart';

class AuthSync {
  final Isar _isar;
  AuthSync(this._isar);
  Future<ErrorHandler<bool>> call(LoginState loginState) async {
    var result = await GetAuthUserGraphqlDatasource()(loginState);
    return result.fold((l) => left(LocaleKeys.auth_failed), (r) async {
          return (await StoreAuthDatasource(_isar)(AuthDto.fromIsar(r)))
              .fold((l) => left(LocaleKeys.auth_failed), (r) => right(true));
        });
  }
}
