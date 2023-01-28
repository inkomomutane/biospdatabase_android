import '../../../core/error_handler.dart';
import '../../entity/document_types/document_type_entity.dart';
import '../../repository/get_all_document_types_repository.dart';

class GetAllDocumentTypes {
  final GetAllDocumentTypesRepository _getAllDocumentTypesRepository;
  GetAllDocumentTypes(this._getAllDocumentTypesRepository);
  Future<ErrorHandler<List<DocumentTypeEntity>>> call() =>
      _getAllDocumentTypesRepository();
}
