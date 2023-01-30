import '../../datasource/isar/model/genres/genre.dart';
import '../../../domain/entity/genres/genre_entity.dart';
import 'package:ulid4d/ulid4d.dart';
abstract class GenreDto {
   static GenreEntity fromIsar(Genre? genre)  => GenreEntity(ulid: ULID.fromString(genre!.ulid), name: genre.name);
   static Genre fromEntity(GenreEntity? genreEntity) =>
       Genre()..name = genreEntity!.name
          ..ulid = genreEntity.ulid.toString()
       ..id = genreEntity.id
   ;
}
