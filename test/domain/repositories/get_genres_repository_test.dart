import "package:biosp/core/error_handler.dart";
import "package:biosp/domain/entity/genres/genre_entity.dart";
import "package:biosp/domain/repository/get_all_genres_repository.dart";
import "package:flutter_test/flutter_test.dart";
import "package:mockito/annotations.dart";
import "package:mockito/mockito.dart";
import "package:ulid4d/ulid4d.dart";
import 'get_genres_repository_test.mocks.dart';

@GenerateNiceMocks([MockSpec<GetAllGenresRepository>()])
void main(){
 late final MockGetAllGenresRepository mockGetAllGenresRepository;
 late final String name;
 late final ULID ulid;
 setUp(() {
   mockGetAllGenresRepository = MockGetAllGenresRepository();
   name = 'Male';
   ulid  = ULID.nextULID();
 });
  test('it repository should get all genres',() async {
    when(mockGetAllGenresRepository()).
    thenAnswer( (answer) =>  Future(() =>  ErrorHandler.right([GenreEntity(ulid: ulid, name: name)])));
    final genreEntities = await mockGetAllGenresRepository();
    genreEntities.fold((l) => null , (r) async {
      expect( (r).first, GenreEntity(ulid: ulid, name: name));
    });
  });
}