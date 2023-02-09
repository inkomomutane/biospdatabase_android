import '../isar/model/reasons_of_opening_case/reason_of_opening_case.dart';
import '../../dto/reasons_of_opening_cases/reasons_of_opening_case_dto.dart';
import '../../../services/graphql.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/error_handler.dart';

class GetAllReasonOpeningCasesGraphqlDatasource  {
  Future<ErrorHandler<List<ReasonOfOpeningCase>>> call() async {
    var response =  await GraphqlQueryResource.query('''
     query biosp {
        me {
          biosp{
            reasonOpeningCases{
              ulid
              name
            }
         }
        }
     }
     ''');
    return response.fold((l) => left(l), (r) {
      List? answer =  r['me']['biosp']['reasonOpeningCases'];
      if(answer == null){
        return left("No data found!");
      }
      return right(answer.map((reasonOfOpeningCase) => ReasonOfOpeningCaseDto.fromGraphql(reasonOfOpeningCase as Map<String, dynamic>))
          .toList()
      );
    });
  }
}
