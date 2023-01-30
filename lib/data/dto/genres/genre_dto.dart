import 'package:ulid4d/ulid4d.dart';

import '../../../domain/entity/genres/genre_entity.dart';
import '../../datasource/isar/model/genres/genre.dart';

abstract class GenreDto {
  static GenreEntity fromIsar(Genre? genre) => GenreEntity(
      ulid: ULID.fromString(genre!.ulid), name: genre.name, id: genre.id);

  static Genre fromEntity(GenreEntity? genreEntity) => Genre()
    ..name = genreEntity!.name
    ..ulid = genreEntity.ulid.toString()
    ..id = genreEntity.id;
}
