import 'package:biosp/core/error_handler.dart';
import 'package:biosp/domain/actions/biosp_services/get_all_purpuse_of_visits.dart';
import 'package:biosp/domain/entity/purposes_of_visit/purpose_of_visit_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ulid4d/ulid4d.dart';

import '../../repositories/biosp_services/purpose_of_visits/get_all_purpuse_of_visits_repository_test.mocks.dart';

void main() {
  late final MockGetAllPurposeOfVisitsRepository
      mockGetAllPurposeOfVisitsRepository;
  late final GetAllPurposeOfVisits getAllPurposeOfVisits;
  late final String name;
  late final ULID ulid;
  setUp(() {
    mockGetAllPurposeOfVisitsRepository = MockGetAllPurposeOfVisitsRepository();
    getAllPurposeOfVisits =
        GetAllPurposeOfVisits(mockGetAllPurposeOfVisitsRepository);
    name = 'Male';
    ulid = ULID.nextULID();
  });
  test('it should get all purposes of visit', () async {
    when(mockGetAllPurposeOfVisitsRepository()).thenAnswer(
      (answer) async => ErrorHandler.right(
        [PurposeOfVisitEntity(ulid: ulid, name: name)],
      ),
    );
    final purposeOfVisitEntity = await getAllPurposeOfVisits();
    purposeOfVisitEntity.fold((l) => null, (r) async {
      expect((r).first, PurposeOfVisitEntity(ulid: ulid, name: name));
    });
  });
}
