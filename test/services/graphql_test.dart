import 'package:biosp/core/inject.dart';
import 'package:biosp/data/datasource/graphql/create_beneficiary_datasource.dart';
import 'package:biosp/data/datasource/isar/model/auth/auth.dart';
import 'package:biosp/services/graphql.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:graphql/client.dart';
import 'package:isar/isar.dart';
import  '../helpers/helpers.dart';

void main() async {
  Inject.init();
  late final String query;
  setUp((){
    query = r'''
    mutation n {
      login(email: "test@test.com",password:"password"){
        ulid,
        name,
        email,
        token,
        created_at,
        updated_at
      }
    }
''';
  });


  test('Test of putting auth token to test on live server', () async {

    GetIt.I<Isar>().writeTxn(() async{
      var auth = await GetIt.I<Isar>().auths.get(1);
      await GetIt.I<Isar>().auths.put(Auth(name: auth!.name, email: auth.email, token: "B4tuAl7VpJ2eZvKLkbvNUHjoih9kPlRu0UrCT7X3"));
    });
    var result = await CreateBeneficiaryGraphqlDatasource()(beneficiaryEntityTestTrait());
    var token =  GetIt.I<AuthLink>().getToken();
    result.fold((l) => expect(l, 'No data found!c'), (r) => expect(r['me'],''));
  });
}
