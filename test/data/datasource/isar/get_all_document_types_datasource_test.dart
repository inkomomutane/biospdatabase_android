import 'package:biosp/data/datasource/isar/datasource/get_all_document_types_datasource.dart';
import 'package:biosp/data/datasource/isar/datasource/internal/create_document_type_datasource.dart';
import 'package:biosp/data/datasource/isar/model/document_types/document_type.dart';
import 'package:biosp/domain/entity/document_types/document_type_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:ulid4d/ulid4d.dart';

import '../../../core/testing_inject.dart';


void main() {
  TestingInject.init();
  late ULID ulid;
  late DocumentTypeEntity documentTypeEntity;
  setUp(() async {
    await Isar.initializeIsarCore();
    ulid = ULID.nextULID();
    documentTypeEntity =
        DocumentTypeEntity(ulid: ulid, name: 'documentType', id: 1);
    await CreateDocumentTypeDatasource( GetIt.I<Isar>())(documentTypeEntity);
  });

  tearDown(() {
    GetIt.I<Isar>().writeTxn(() async => await  GetIt.I<Isar>().documentTypes.clear());
  });

  test('it should read all document types from isar database', () async {
    var result = await GetAllDocumentTypesDatasource( GetIt.I<Isar>())();
    result.fold((l) => expect(l, ''), (r) {
      expect(r.contains(documentTypeEntity), true);
    });
  });
}
