import 'package:biosp/core/error_handler.dart';
import 'package:biosp/domain/actions/biosp_services/get_all_provenance.dart';
import 'package:biosp/domain/entity/provenances/provenance_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ulid4d/ulid4d.dart';

import '../../repositories/biosp_services/provenances/get_all_provenance_repository_test.mocks.dart';

void main() {
  late final MockGetAllProvenancesRepository mockGetAllProvenancesRepository;
  late final GetAllProvenances getAllProvenances;
  late final String name;
  late final ULID ulid;
  setUp(() {
    mockGetAllProvenancesRepository = MockGetAllProvenancesRepository();
    getAllProvenances = GetAllProvenances(mockGetAllProvenancesRepository);
    name = 'Male';
    ulid = ULID.nextULID();
  });
  test('it should get all provenances', () async {
    when(mockGetAllProvenancesRepository()).thenAnswer(
      (answer) async => ErrorHandler.right(
        [ProvenanceEntity(ulid: ulid, name: name)],
      ),
    );
    final provenanceEntity = await getAllProvenances();
    provenanceEntity.fold((l) => null, (r) async {
      expect((r).first, ProvenanceEntity(ulid: ulid, name: name));
    });
  });
}
