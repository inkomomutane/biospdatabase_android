import 'package:biosp/core/error_handler.dart';
import 'package:biosp/domain/actions/biosp_services/get_all_document_types.dart';
import 'package:biosp/domain/entity/document_types/document_type_entity.dart';
import 'package:biosp/domain/repository/get_all_document_types_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ulid4d/ulid4d.dart';
import 'get_all_document_types_test.mocks.dart';

@GenerateNiceMocks([MockSpec<GetAllDocumentTypesRepository>()])
void main() {
  late final MockGetAllDocumentTypesRepository
      mockGetAllDocumentTypesRepository;
  late final GetAllDocumentTypes getAllDocumentTypes;
  late final String name;
  late final ULID ulid;
  setUp(() {
    mockGetAllDocumentTypesRepository = MockGetAllDocumentTypesRepository();
    getAllDocumentTypes = GetAllDocumentTypes(
        mockGetAllDocumentTypesRepository);

    name = 'Male';
    ulid = ULID.nextULID();
  });
  test('it should get all document types', () async {
    when(mockGetAllDocumentTypesRepository()).thenAnswer((answer) => Future(
        () =>
            ErrorHandler.right([DocumentTypeEntity(ulid: ulid, name: name)])));
    final documentTypeEntities = await getAllDocumentTypes();
    documentTypeEntities.fold((l) => null, (r) async {
      expect((r).first, DocumentTypeEntity(ulid: ulid, name: name));
    });
  });
}
