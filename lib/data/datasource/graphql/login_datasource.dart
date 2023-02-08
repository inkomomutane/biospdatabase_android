import 'package:biosp/bloc/components/cubit/login_state.dart';
import 'package:biosp/data/datasource/isar/model/auth/auth.dart';
import 'package:biosp/data/dto/auth/auth_dto.dart';
import 'package:fpdart/fpdart.dart';

import '../../../core/error_handler.dart';
import '../../../services/graphql.dart';

class GetAuthUserGraphqlDatasource {
  Future<ErrorHandler<Auth>> call(LoginState login) async {
    var response = await GraphqlQueryResource.query('''
    mutation auth {
      login(email: ${login.email}, password: ${login.email}){
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
      Map<String, dynamic>? answer = r['me'];
      if (answer == null) {
        return left("No data found!");
      }
      return right(AuthDto.fromGraphql(answer));
    });
  }
}
