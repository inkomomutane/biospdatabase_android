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
    documentTypeEntity = DocumentTypeEntity(ulid: ulid, name: 'biosp');
  });

  tearDown(() {
    isar.writeTxn(() async => await isar.documentTypes.clear());
  });

  test('it should create document type from isar database', () async {
    var result = await CreateDocumentTypeDatasource(isar)(documentTypeEntity);
    result.fold((l) => expect(l, ''), (r) async {
      DocumentTypeEntity documentTypeIsar = documentTypeEntity.copyWith(id: r);
      var documentType = await isar.txn(() async =>
          DocumentTypeDto.fromIsar((await isar.documentTypes.get(1))));
      expect(documentType, documentTypeIsar);
    });
  });
}
