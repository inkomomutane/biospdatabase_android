import '../../core/error_handler.dart';
import '../entity/auth/auth_entity.dart';
import '../repository/get_stored_auth_user_repository.dart';

class GetAuthUser {
  final GetAuthUserRepository _authUserRepository;
  GetAuthUser(this._authUserRepository);
  Future<ErrorHandler<AuthEntity>> call() => _authUserRepository();
}