import 'package:biosp/data/datasource/isar/model/purposes_of_visit/purpose_of_visit.dart';
import 'package:biosp/data/dto/purpose_of_visits/purpose_of_visit_dto.dart';
import 'package:biosp/services/graphql.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/error_handler.dart';

class GetAllPurposeOfVisitsGraphqlDatasource  {
  Future<ErrorHandler<List<PurposeOfVisit>>> call() async {
    var response =  await GraphqlQueryResource.query('''
     query biosp {
        me {
          biosp{
            purposeOfVisits{
              ulid
              name
            }
         }
        }
     }
     ''');
    return response.fold((l) => left(l), (r) {
      List? answer =  r['me']['biosp']['purposeOfVisits'];
      if(answer == null){
        return left("No data found!");
      }
      return right(answer.map((purposeOfVisit) => PurposeOfVisitDto.fromGraphql(purposeOfVisit as Map<String, dynamic>))
          .toList()
      );
    });
  }
}
