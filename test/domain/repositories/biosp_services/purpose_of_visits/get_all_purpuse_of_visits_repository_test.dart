import 'package:biosp/core/error_handler.dart';
import 'package:biosp/domain/entity/purposes_of_visit/purpose_of_visit_entity.dart';
import 'package:biosp/domain/repository/get_all_purpuse_of_visits_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ulid4d/ulid4d.dart';

import 'get_all_purpuse_of_visits_repository_test.mocks.dart';

@GenerateNiceMocks([MockSpec<GetAllPurposeOfVisitsRepository>()])
void main() {
  late final MockGetAllPurposeOfVisitsRepository
      mockGetAllPurposeOfVisitsRepository;
  late final String name;
  late final ULID ulid;
  setUp(() {
    mockGetAllPurposeOfVisitsRepository = MockGetAllPurposeOfVisitsRepository();
    name = 'Male';
    ulid = ULID.nextULID();
  });
  test('it repository should get all purposes of visit', () async {
    when(mockGetAllPurposeOfVisitsRepository()).thenAnswer(
      (answer) async => ErrorHandler.right(
        [PurposeOfVisitEntity(ulid: ulid, name: name)],
      ),
    );
    final purposeOfVisitEntity = await mockGetAllPurposeOfVisitsRepository();
    purposeOfVisitEntity.fold((l) => null, (r) async {
      expect((r).first, PurposeOfVisitEntity(ulid: ulid, name: name));
    });
  });
}
