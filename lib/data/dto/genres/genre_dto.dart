import 'package:ulid4d/ulid4d.dart';

import '../../../core/inject.dart';
import '../../../domain/entity/genres/genre_entity.dart';
import '../../datasource/isar/model/genres/genre.dart';

abstract class GenreDto {
  static GenreEntity fromIsar(Genre? genre) => GenreEntity(
      ulid: ULID.fromString(genre!.ulid), name: genre.name, id: genre.id);

  static Genre fromEntity(GenreEntity? genreEntity) => Genre()
    ..name = genreEntity!.name
    ..ulid = genreEntity.ulid.toString()
  ;

  static Genre fromGraphql(Map<String,dynamic> graphql) => Genre()
    ..name = graphql['name']..ulid =  Inject.toUppercase(graphql['ulid'] as String);
}
