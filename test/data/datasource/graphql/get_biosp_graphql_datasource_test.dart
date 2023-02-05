import 'package:biosp/core/inject.dart';
import 'package:biosp/data/datasource/graphql/get_biosp_graphql_datasource.dart';
import 'package:biosp/data/datasource/isar/model/biosps/biosp.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  Inject.init();
  group('tests running on live server.', () {
    test('it should get biosp of this user from graphql.', () async {
      var result = await GetBiospGraphqlDatasource()();
      result.fold((l) => expect(l, 'No data found!'), (r) => expect(r,isInstanceOf<Biosp>()));
    });
  });
}
