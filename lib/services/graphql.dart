import 'package:fpdart/fpdart.dart';
import 'package:get_it/get_it.dart';
import 'package:graphql/client.dart';

import '../core/error_handler.dart' as app_error_handler;

abstract class GraphqlQueryResource {
  static Future<app_error_handler.ErrorHandler<Map<String, dynamic>>> query(
      String query) async {
    try {
      var queryData = await GetIt.I<GraphQLClient>().query(
          QueryOptions(document: gql(query), fetchPolicy: FetchPolicy.noCache));
      var queryResult = queryData.data;
      if (queryResult == null || queryData.hasException) {
        return left(queryData.exception?.originalStackTrace.toString() ??
            "No data found.");
      } else {
        return right(queryResult);
      }
    } on Exception catch (o, s) {
      return left(s.toString());
    }
  }
}
