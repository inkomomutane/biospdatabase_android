import '../../core/error_handler.dart';
import '../entity/auth/auth_entity.dart';

abstract class GetAuthUserRepository {
  Future<ErrorHandler<AuthEntity>> call();
}
