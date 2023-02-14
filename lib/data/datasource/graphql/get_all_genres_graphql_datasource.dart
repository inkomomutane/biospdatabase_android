import 'package:fpdart/fpdart.dart';

import '../../../../core/error_handler.dart';
import '../../../services/graphql.dart';
import '../../dto/genres/genre_dto.dart';
import '../isar/model/genres/genre.dart';

class GetAllGenresGraphqlDatasource  {
  Future<ErrorHandler<List<Genre>>> call() async {
    var response =  await GraphqlQueryResource.query('''
     query biosp {
        me {
          biosp{
            genres{
              ulid
              name
            }
         }
        }
     }
     ''');
    return response.fold((l) => left(l), (r) {
      List? answer =  r['me']['biosp']['genres'];
      if(answer == null){
        return left("No data found!");
      }
      return right(answer.map((genre) => GenreDto.fromGraphql(genre as Map<String, dynamic>))
          .toList()
      );
    });
  }
}
