import 'package:biosp/data/datasource/isar/datasource/internal/create_genre_datasource.dart';
import 'package:biosp/data/datasource/isar/model/genres/genre.dart';
import 'package:biosp/data/dto/genres/genre_dto.dart';
import 'package:biosp/domain/entity/genres/genre_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:ulid4d/ulid4d.dart';

import '../../../../core/testing_inject.dart';


void main() {
TestingInject.init();
  late ULID ulid;
  late GenreEntity genreEntity;
  setUp(() async {
    await Isar.initializeIsarCore();
    ulid = ULID.nextULID();
    genreEntity = GenreEntity(ulid: ulid, name: 'genre');
  });

  tearDown(() {
    GetIt.I<Isar>().writeTxn(() async => await  GetIt.I<Isar>().genres.clear());
  });

  test('it should create genre from isar database', () async {
    var result = await CreateGenreDatasource( GetIt.I<Isar>())(genreEntity);
    result.fold((l)  => expect(l,''), (r) async {
      GenreEntity genreIsar = genreEntity.copyWith(id: r);
      var genre = await  GetIt.I<Isar>()
          .txn(() async => GenreDto.fromIsar((await  GetIt.I<Isar>().genres.get(1))));
      expect(genre, genreIsar);
    });
  });
}
