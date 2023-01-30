import 'package:biosp/data/datasource/isar/datasource/get_all_genres_datasource.dart';
import 'package:biosp/data/datasource/isar/datasource/internal/create_genre_datasource.dart';
import 'package:biosp/data/datasource/isar/model/genres/genre.dart';
import 'package:biosp/domain/entity/genres/genre_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:ulid4d/ulid4d.dart';

void main() {
  late Isar isar;
  late ULID ulid;
  late GenreEntity genreEntity;
  setUp(() async {
    await Isar.initializeIsarCore();
    isar = await Isar.open([GenreSchema]);
    ulid = ULID.nextULID();
    genreEntity = GenreEntity(ulid: ulid, name: 'genre',id: 1);
    await CreateGenreDatasource(isar)(genreEntity);
  });

  tearDown(() {
    isar.writeTxn(() async => await isar.genres.clear());
  });

  test('it should read all genres from isar database', () async {
    var result = await GetAllGenresDatasource(isar)();
    result.fold((l) => expect(l, ''), (r){
      expect(r, [genreEntity]);
    });
  });
}
