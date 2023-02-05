import 'package:biosp/core/inject.dart';
import 'package:biosp/data/datasource/graphql/get_all_reasons_of_opening_case_graphql_datasource.dart';
import 'package:biosp/data/datasource/isar/model/reasons_of_opening_case/reason_of_opening_case.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  Inject.init();
  group('tests running on live server.', () {
    test('it should get all reasons of opening case in this user from graphql.', () async {
      var result = await GetAllReasonOpeningCasesGraphqlDatasource()();
      result.fold((l) => expect(l, 'No data found!'), (r) => expect(r,isInstanceOf<List<ReasonOfOpeningCase>>()));
    });
  });
}