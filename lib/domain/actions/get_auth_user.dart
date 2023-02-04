import 'package:biosp/core/error_handler.dart';
import 'package:biosp/domain/entity/auth/auth_entity.dart';
import 'package:biosp/domain/repository/get_stored_auth_user_repository.dart';

class GetAuthUser {
  final GetAuthUserRepository _authUserRepository;
  GetAuthUser(this._authUserRepository);
  Future<ErrorHandler<AuthEntity>> call() => _authUserRepository();
}