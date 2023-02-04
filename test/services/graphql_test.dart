import 'package:biosp/services/client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql/client.dart';

void main() async {
  final httpLink = HttpLink(
    'http://127.0.0.1:8000/graphql',
  );

  Link link = httpLink;

  final GraphQLClient client = GraphQLClient(
    /// **NOTE** The default store is the InMemoryStore, which does NOT persist to disk
    cache: GraphQLCache(),
    link: link,
  );
  QueryOptions options = QueryOptions(document: gql(r'''
    query n {
      genres{
        ulid,
        name,
        created_at,
        updated_at
      }
    }
'''));

  test('description', () async {
    QueryResult result = await client.query(options);

    // print(result.data!['genres']);
    expect(result.data!['genres'], 'matcher');
  });
}
