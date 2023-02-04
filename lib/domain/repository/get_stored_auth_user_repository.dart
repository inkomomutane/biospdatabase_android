import 'package:biosp/core/error_handler.dart';
import 'package:biosp/domain/entity/auth/auth_entity.dart';

abstract class GetAuthUserRepository {
  Future<ErrorHandler<AuthEntity>> call();
}
