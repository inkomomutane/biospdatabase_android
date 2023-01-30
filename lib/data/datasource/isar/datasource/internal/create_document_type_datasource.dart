import 'package:fpdart/fpdart.dart';
import 'package:isar/isar.dart';

import '../../../../../core/error_handler.dart';
import '../../../../../domain/entity/document_types/document_type_entity.dart';
import '../../../../dto/document_types/document_type_dto.dart';
import '../../model/document_types/document_type.dart';

class CreateDocumentTypeDatasource {
  final Isar _isar;
  CreateDocumentTypeDatasource(this._isar);
  Future<ErrorHandler<int>> call(DocumentTypeEntity documentTypeEntity) {
    try {
      return Future(() => right(_isar.writeTxnSync(() => _isar.documentTypes
          .putSync(DocumentTypeDto.fromEntity(documentTypeEntity)))));
    } on Exception catch (_, e) {
      return Future(() => left(e.toString()));
    }
  }
}
