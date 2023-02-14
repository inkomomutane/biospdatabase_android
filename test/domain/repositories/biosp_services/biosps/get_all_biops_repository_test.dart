import 'package:biosp/core/error_handler.dart';
import 'package:biosp/domain/entity/biosps/biosp_entity.dart';
import 'package:biosp/domain/repository/get_all_biosps_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ulid4d/ulid4d.dart';

import 'get_all_biops_repository_test.mocks.dart';

@GenerateNiceMocks([MockSpec<GetAllBiospsRepository>()])
void main() {
  late final MockGetAllBiospsRepository mockGetAllBiospsRepository;
  late final String name;
  late final ULID ulid;
  late final String projectName;
  setUp(() {
    mockGetAllBiospsRepository = MockGetAllBiospsRepository();
    name = 'Male';
    ulid = ULID.nextULID();
    projectName = 'Akulo-Akulo';
  });
  test('it repository should get all biosps', () async {
    when(mockGetAllBiospsRepository()).thenAnswer(
      (answer) async => ErrorHandler.right(
        [BiospEntity(ulid: ulid, name: name, projectName: projectName)],
      ),
    );
    final biospEntities = await mockGetAllBiospsRepository();
    biospEntities.fold((l) => null, (r) async {
      expect((r).first,
          BiospEntity(ulid: ulid, name: name, projectName: projectName));
    });
  });
}
