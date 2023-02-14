import 'package:fpdart/fpdart.dart';

import '../../../../core/error_handler.dart';
import '../../../services/graphql.dart';
import '../../dto/biosps/biosp_dto.dart';
import '../isar/model/biosps/biosp.dart';
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
