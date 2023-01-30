import 'package:biosp/data/datasource/isar/datasource/internal/create_genre_datasource.dart';
import 'package:biosp/data/datasource/isar/model/genres/genre.dart';
import 'package:biosp/data/dto/genres/genre_dto.dart';
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
    genreEntity = GenreEntity(ulid: ulid, name: 'genre');
  });

  tearDown(() {
    isar.writeTxn(() async => await isar.genres.clear());
  });

  test('it should create genre entity and read all genres from isar database', () async {
    var result = await CreateGenreDatasource(isar)(genreEntity);
    result.fold((l)  => expect(l,''), (r) async {
      GenreEntity genreIsar = genreEntity.copyWith(id: r);
      var genre = await isar
          .txn(() async => GenreDto.fromIsar((await isar.genres.get(1))));
      expect(genre, genreIsar);
    });
  });
}
