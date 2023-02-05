import 'package:biosp/data/datasource/isar/datasource/internal/create_document_type_datasource.dart';
import 'package:biosp/data/datasource/isar/model/document_types/document_type.dart';
import 'package:biosp/data/dto/document_types/document_type_dto.dart';
import 'package:biosp/domain/entity/document_types/document_type_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:ulid4d/ulid4d.dart';

import '../../../../core/testing_inject.dart';


void main() {
TestingInject.init();
  late ULID ulid;
  late DocumentTypeEntity documentTypeEntity;
  setUp(() async {
    await Isar.initializeIsarCore();
    ulid = ULID.nextULID();
    documentTypeEntity = DocumentTypeEntity(ulid: ulid, name: 'biosp');
  });

  tearDown(() {
    GetIt.I<Isar>().writeTxn(() async => await  GetIt.I<Isar>().documentTypes.clear());
  });

  test('it should create document type from isar database', () async {
    var result = await CreateDocumentTypeDatasource( GetIt.I<Isar>())(documentTypeEntity);
    result.fold((l) => expect(l, ''), (r) async {
      DocumentTypeEntity documentTypeIsar = documentTypeEntity.copyWith(id: r);
      var documentType = await  GetIt.I<Isar>().txn(() async =>
          DocumentTypeDto.fromIsar((await  GetIt.I<Isar>().documentTypes.get(1))));
      expect(documentType, documentTypeIsar);
    });
  });
}
