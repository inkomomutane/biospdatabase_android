import 'package:biosp/data/datasource/isar/model/biosps/biosp.dart';
import 'package:biosp/data/dto/biosps/biosp_dto.dart';
import 'package:biosp/services/graphql.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/error_handler.dart';
class GetBiospGraphqlDatasource{
  Future<ErrorHandler<Biosp>> call() async {
   var response =  await GraphqlQueryResource.query('''
     query biosp {
        me {
          biosp{
            ulid
            name
            project_name
         }
        }
     }
     ''');
   return response.fold((l) => left(l), (r) {
      Map<String,dynamic>? answer =  r['me']['biosp'];
      if(answer == null){
        return left("No data found!");
      }
      return right(BiospDto.fromGraphql(answer));
   });
  }
}
