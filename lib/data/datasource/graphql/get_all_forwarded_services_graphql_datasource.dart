import 'package:fpdart/fpdart.dart';

import '../../../core/error_handler.dart';
import '../../../services/graphql.dart';
import '../../dto/forwarded_services/forwarded_service_dto.dart';
import '../isar/model/forwarded_services/forwarded_service.dart';

class GetAllForwardedServicesGraphqlDatasource  {
  Future<ErrorHandler<List<ForwardedService>>> call() async {
    var response =  await GraphqlQueryResource.query('''
     query documentTypes {
        me {
          biosp{
            forwardedServices{
              ulid
              name
            }
         }
        }
     }
     ''');
    return response.fold((l) => left(l), (r) {
      List? answer =  r['me']['biosp']['forwardedServices'];
      if(answer == null){
        return left("No data found!");
      }
      return right(answer.map((forwardedService) => ForwardedServiceDto.fromGraphql(forwardedService as Map<String, dynamic>))
          .toList()
      );
    });
  }
}
