import 'package:biosp/core/error_handler.dart';
import 'package:biosp/domain/entity/reasons_of_opening_case/reason_of_opening_case_entity.dart';
import 'package:biosp/domain/repository/get_all_reasons_of_opening_case_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ulid4d/ulid4d.dart';

import 'get_all_reasons_of_opening_case_repository_test.mocks.dart';

@GenerateNiceMocks([MockSpec<GetAllReasonOfOpeningCasesRepository>()])
void main() {
  late final MockGetAllReasonOfOpeningCasesRepository
      mockGetAllReasonOfOpeningCasesRepository;
  late final String name;
  late final ULID ulid;
  setUp(() {
    mockGetAllReasonOfOpeningCasesRepository =
        MockGetAllReasonOfOpeningCasesRepository();
    name = 'Male';
    ulid = ULID.nextULID();
  });
  test('it repository should get all reasonOfOpeningCases', () async {
    when(mockGetAllReasonOfOpeningCasesRepository()).thenAnswer(
      (answer) async => ErrorHandler.right(
        [ReasonOfOpeningCaseEntity(ulid: ulid, name: name)],
      ),
    );
    final reasonOfOpeningCaseEntities =
        await mockGetAllReasonOfOpeningCasesRepository();
    reasonOfOpeningCaseEntities.fold((l) => null, (r) async {
      expect((r).first, ReasonOfOpeningCaseEntity(ulid: ulid, name: name));
    });
  });
}
