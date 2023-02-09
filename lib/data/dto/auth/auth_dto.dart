import '../../datasource/isar/model/auth/auth.dart';
import '../../../domain/entity/auth/auth_entity.dart';

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

  static Auth fromGraphql(Map<String,dynamic> graphql) => Auth(name: graphql['name'], email: graphql['email'], token: graphql['token']);

}
