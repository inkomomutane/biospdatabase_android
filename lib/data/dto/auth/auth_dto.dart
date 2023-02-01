import 'package:biosp/data/datasource/isar/model/auth/auth.dart';
import 'package:biosp/domain/entity/auth/auth_entity.dart';

abstract class AuthDto {
  static AuthEntity fromIsar(Auth? auth) => AuthEntity(
        id: auth!.id,
        email: auth.email,
        name: auth.name,
        token: auth.token,
      );

  static Auth fromEntity(AuthEntity? authEntity) => Auth(
        name: authEntity!.name,
        email: authEntity.email,
        token: authEntity.token,
      );
}
