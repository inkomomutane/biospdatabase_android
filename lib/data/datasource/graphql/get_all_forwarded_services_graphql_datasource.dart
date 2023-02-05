import 'package:biosp/core/error_handler.dart';
import 'package:biosp/data/datasource/isar/model/forwarded_services/forwarded_service.dart';
import 'package:biosp/data/dto/forwarded_services/forwarded_service_dto.dart';
import 'package:biosp/services/graphql.dart';
import 'package:fpdart/fpdart.dart';

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
