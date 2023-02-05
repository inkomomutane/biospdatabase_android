import 'package:biosp/core/inject.dart';
import 'package:biosp/data/datasource/graphql/get_all_provenance_graphql_datasource.dart';
import 'package:biosp/data/datasource/isar/model/provenances/provenance.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  Inject.init();
  group('tests running on live server.', () {
    test('it should get all provenances of this user from graphql.', () async {
      var result = await GetAllProvenancesGraphqlDatasource()();
      result.fold((l) => expect(l, 'No data found!'), (r) => expect(r,isInstanceOf<List<Provenance>>()));
    });
  });
}