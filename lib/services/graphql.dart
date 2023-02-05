 import 'package:fpdart/fpdart.dart';
import 'package:get_it/get_it.dart';
import 'package:graphql/client.dart';
import '../core/error_handler.dart' as app_error_handler;
abstract class GraphqlQueryResource{
  static Future<app_error_handler.ErrorHandler<Map<String,dynamic>>> query(String query) async{
    try{
      var queryData  = await GetIt.I<GraphQLClient>().query(QueryOptions(document: gql(query)));
      var queryResult = queryData.data;
      if(queryResult == null) {
        return Future(() => left(queryData.exception?.graphqlErrors.first.toString() ?? "No data found."));
      } else {
        return Future(() => right(queryResult));
      }
    }on Exception catch(o,s){
      return Future(() => left(s.toString()));
    }
  }
}