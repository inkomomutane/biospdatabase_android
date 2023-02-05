import 'package:biosp/data/datasource/isar/datasource/get_all_genres_datasource.dart';
import 'package:biosp/data/datasource/isar/datasource/internal/create_genre_datasource.dart';
import 'package:biosp/data/datasource/isar/model/genres/genre.dart';
import 'package:biosp/domain/entity/genres/genre_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:ulid4d/ulid4d.dart';

import '../../../core/testing_inject.dart';

void main() {
  TestingInject.init();
  late ULID ulid;
  late GenreEntity genreEntity;
  setUp(() async {
    await Isar.initializeIsarCore();
    ulid = ULID.nextULID();
    genreEntity = GenreEntity(ulid: ulid, name: 'genre',id: 1);
    await CreateGenreDatasource( GetIt.I<Isar>())(genreEntity);
  });

  tearDown(() {
    GetIt.I<Isar>().writeTxn(() async => await  GetIt.I<Isar>().clear());
  });

  test('it should read all genres from isar database', () async {
    var result = await GetAllGenresDatasource( GetIt.I<Isar>())();
    result.fold((l) => expect(l, ''), (r){
      expect(r.contains(genreEntity),true);
    });
  });
}
