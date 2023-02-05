import 'package:biosp/data/datasource/isar/model/document_types/document_type.dart';
import 'package:biosp/data/dto/document_types/document_type_dto.dart';
import 'package:biosp/services/graphql.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/error_handler.dart';

class GetAllDocumentTypesGraphqlDatasource  {
  Future<ErrorHandler<List<DocumentType>>> call() async {
    var response =  await GraphqlQueryResource.query('''
     query documentTypes {
        me {
          biosp{
            documentTypes{
              ulid
              name
            }
         }
        }
     }
     ''');
    return response.fold((l) => left(l), (r) {
      List? answer =  r['me']['biosp']['documentTypes'];
      if(answer == null){
        return left("No data found!");
      }
      return right(answer.map((documentType) => DocumentTypeDto.fromGraphql(documentType as Map<String, dynamic>))
          .toList()
      );
    });
  }
}
