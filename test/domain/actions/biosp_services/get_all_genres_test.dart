import "package:biosp/core/error_handler.dart";
import "package:biosp/domain/actions/biosp_services/get_all_genres.dart";
import "package:biosp/domain/entity/genres/genre_entity.dart";
import "package:flutter_test/flutter_test.dart";
import "package:mockito/mockito.dart";
import "package:ulid4d/ulid4d.dart";

import "../../repositories/biosp_services/genres/get_all_genres_repository_test.mocks.dart";

void main() {
  late final MockGetAllGenresRepository mockGetAllGenresRepository;
  late final GetAllGenres getAllGenres;
  late final String name;
  late final ULID ulid;
  setUp(() {
    mockGetAllGenresRepository = MockGetAllGenresRepository();
    name = 'Male';
    ulid = ULID.nextULID();
    getAllGenres = GetAllGenres(mockGetAllGenresRepository);
  });
  test('it should get all genres', () async {
    when(mockGetAllGenresRepository()).thenAnswer((answer) => Future(
        () => ErrorHandler.right([GenreEntity(ulid: ulid, name: name)])));
    final genreEntities = await getAllGenres();
    genreEntities.fold((l) => null, (r) async {
      expect((r).first, GenreEntity(ulid: ulid, name: name));
    });
  });
}
