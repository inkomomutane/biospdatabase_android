import 'package:biosp/core/error_handler.dart';
import 'package:biosp/domain/entity/provenances/provenance_entity.dart';
import 'package:biosp/domain/repository/get_all_provenance_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ulid4d/ulid4d.dart';

import 'get_all_provenance_repository_test.mocks.dart';

@GenerateNiceMocks([MockSpec<GetAllProvenancesRepository>()])
void main() {
  late final MockGetAllProvenancesRepository mockGetAllProvenancesRepository;
  late final String name;
  late final ULID ulid;
  setUp(() {
    mockGetAllProvenancesRepository = MockGetAllProvenancesRepository();
    name = 'Male';
    ulid = ULID.nextULID();
  });
  test('it repository should get all provenances', () async {
    when(mockGetAllProvenancesRepository()).thenAnswer(
      (answer) async => ErrorHandler.right(
        [ProvenanceEntity(ulid: ulid, name: name)],
      ),
    );
    final provenanceEntity = await mockGetAllProvenancesRepository();
    provenanceEntity.fold((l) => null, (r) async {
      expect((r).first, ProvenanceEntity(ulid: ulid, name: name));
    });
  });
}
