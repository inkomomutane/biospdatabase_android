import 'package:biosp/core/error_handler.dart';
import 'package:biosp/data/datasource/isar/model/document_types/document_type.dart';
import 'package:biosp/data/dto/document_types/document_type_dto.dart';
import 'package:biosp/domain/entity/document_types/document_type_entity.dart';
import 'package:biosp/domain/repository/get_all_document_types_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:isar/isar.dart';

class GetAllDocumentTypesDatasource extends GetAllDocumentTypesRepository {
  final Isar _isar;
  GetAllDocumentTypesDatasource(this._isar);
  @override
  Future<ErrorHandler<List<DocumentTypeEntity>>> call() {
    try {
      return Future(() => right(_isar
          .txnSync(() => _isar.documentTypes.where().findAllSync())
          .map((biosp) => DocumentTypeDto.fromIsar(biosp))
          .toList()));
    } on Exception catch (_, e) {
      return Future(() => left(e.toString()));
    }
  }
}
