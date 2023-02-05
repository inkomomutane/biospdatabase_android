import 'package:biosp/core/inject.dart';
import 'package:biosp/data/datasource/graphql/get_all_purpose_of_visit_graphql_datasource.dart';
import 'package:biosp/data/datasource/isar/model/purposes_of_visit/purpose_of_visit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  Inject.init();
  group('tests running on live server.', () {
    test('it should get all purposes of visit in this user from graphql.', () async {
      var result = await GetAllPurposeOfVisitsGraphqlDatasource()();
      result.fold((l) => expect(l, 'No data found!'), (r) => expect(r,isInstanceOf<List<PurposeOfVisit>>()));
    });
  });
}