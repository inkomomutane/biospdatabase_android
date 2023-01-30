
import 'package:ulid4d/ulid4d.dart';

import '../../../domain/entity/document_types/document_type_entity.dart';
import '../../datasource/isar/model/document_types/document_type.dart';

class DocumentTypeDto{
  static DocumentTypeEntity fromIsar(DocumentType? documentType)  =>
      DocumentTypeEntity(ulid: ULID.fromString(documentType!.ulid), name: documentType.name);
  static DocumentType fromEntity(DocumentTypeEntity? documentTypeEntity) =>
      DocumentType()..name = documentTypeEntity!.name..ulid = documentTypeEntity.ulid.toString()
  ..id = documentTypeEntity.id;
}