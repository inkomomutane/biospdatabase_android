import 'package:biosp/core/error_handler.dart';
import 'package:biosp/data/datasource/isar/datasource/get_all_document_types_datasource.dart';
import 'package:biosp/data/datasource/isar/datasource/internal/create_document_type_datasource.dart';
import 'package:biosp/data/datasource/isar/model/document_types/document_type.dart';
import 'package:biosp/data/dto/document_types/document_type_dto.dart';
import 'package:biosp/domain/entity/document_types/document_type_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:ulid4d/ulid4d.dart';


void main() {
  late Isar isar;
  late ULID ulid;
  late DocumentTypeEntity documentTypeEntity;
  setUp(() async {
    await Isar.initializeIsarCore();
    isar = await Isar.open([DocumentTypeSchema]);
    ulid = ULID.nextULID();
    documentTypeEntity =
        DocumentTypeEntity(ulid: ulid, name: 'documentType', id: 1);
    await CreateDocumentTypeDatasource(isar)(documentTypeEntity);
  });

  tearDown(() {
    isar.writeTxn(() async => await isar.documentTypes.clear());
  });

  test('it should read all document types from isar database', () async {
    var result = await GetAllDocumentTypesDatasource(isar)();
    result.fold((l) => expect(l, ''), (r) {
      expect(r, [documentTypeEntity]);
    });
  });
}
