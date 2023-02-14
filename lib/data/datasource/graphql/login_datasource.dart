
import 'package:fpdart/fpdart.dart';

import '../../../bloc/components/views/auth/login_state.dart';
import '../../../core/error_handler.dart';
import '../../../services/graphql.dart';
import '../../dto/auth/auth_dto.dart';
import '../isar/model/auth/auth.dart';

class GetAuthUserGraphqlDatasource {
  Future<ErrorHandler<Auth>> call(LoginState login) async {
    var response = await GraphqlQueryResource.query('''
    mutation auth {
      login(email: "${login.email}", password: "${login.password}"){
        ulid,
        name,
        email,
        token,
        created_at,
        updated_at
      }
    }
     ''');
    return response.fold((l) => left(l), (r) {
      Map<String, dynamic>? answer = r['login'];
      if (answer == null) {
        return left("No data found!");
      }
      return right(AuthDto.fromGraphql(answer));
    });
  }
}
