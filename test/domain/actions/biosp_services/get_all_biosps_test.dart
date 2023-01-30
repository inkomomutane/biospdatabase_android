import 'package:biosp/core/error_handler.dart';
import 'package:biosp/domain/actions/biosp_services/get_all_biosps.dart';
import 'package:biosp/domain/entity/biosps/biosp_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ulid4d/ulid4d.dart';

import '../../repositories/biosp_services/biosps/get_all_biops_repository_test.mocks.dart';

void main() {
  late final MockGetAllBiospsRepository mockGetAllBiospsRepository;
  late final GetAllBiosps getAllBiosps;
  late final String name;
  late final ULID ulid;
  late final String projectName;
  setUp(() {
    mockGetAllBiospsRepository = MockGetAllBiospsRepository();
    getAllBiosps = GetAllBiosps(mockGetAllBiospsRepository);
    name = 'Male';
    ulid = ULID.nextULID();
    projectName = 'Akulo-Akulo';
  });
  test('it should get all biosps', () async {
    when(mockGetAllBiospsRepository()).thenAnswer((answer) => Future(() =>
        ErrorHandler.right(
            [BiospEntity(ulid: ulid, name: name, projectName: projectName)])));
    final biospEntities = await getAllBiosps();
    biospEntities.fold((l) => null, (r) async {
      expect((r).first,
          BiospEntity(ulid: ulid, name: name, projectName: projectName));
    });
  });
}
