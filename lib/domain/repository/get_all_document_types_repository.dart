import '../../core/error_handler.dart';
import '../entity/document_types/document_type_entity.dart';

abstract class GetAllDocumentTypesRepository {
  Future<ErrorHandler<List<DocumentTypeEntity>>> call();
}
