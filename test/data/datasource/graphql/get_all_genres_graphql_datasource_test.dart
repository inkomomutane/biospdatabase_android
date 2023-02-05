import 'package:biosp/core/inject.dart';
import 'package:biosp/data/datasource/graphql/get_all_genres_graphql_datasource.dart';
import 'package:biosp/data/datasource/isar/model/genres/genre.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  Inject.init();
  group('tests running on live server.', () {
    test('it should get all genres of this user from graphql.', () async {
      var result = await GetAllGenresGraphqlDatasource()();
      result.fold((l) => expect(l, 'No data found!'), (r) => expect(r,isInstanceOf<List<Genre>>()));
    });
  });
}