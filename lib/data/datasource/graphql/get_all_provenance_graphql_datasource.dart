import 'package:biosp/data/datasource/isar/model/provenances/provenance.dart';
import 'package:biosp/data/dto/provenances/provenance_dto.dart';
import 'package:biosp/services/graphql.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/error_handler.dart';

class GetAllProvenancesGraphqlDatasource  {
  Future<ErrorHandler<List<Provenance>>> call() async {
    var response =  await GraphqlQueryResource.query('''
     query biosp {
        me {
          biosp{
            provenances{
              ulid
              name
            }
         }
        }
     }
     ''');
    return response.fold((l) => left(l), (r) {
      List? answer =  r['me']['biosp']['provenances'];
      if(answer == null){
        return left("No data found!");
      }
      return right(answer.map((provenance) => ProvenanceDto.fromGraphql(provenance as Map<String, dynamic>))
          .toList()
      );
    });
  }
}
