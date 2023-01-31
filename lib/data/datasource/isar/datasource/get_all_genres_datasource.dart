import 'package:fpdart/fpdart.dart';
import 'package:isar/isar.dart';

import '../../../../core/error_handler.dart';
import '../../../../domain/entity/genres/genre_entity.dart';
import '../../../../domain/repository/get_all_genres_repository.dart';
import '../../../dto/genres/genre_dto.dart';
import '../model/genres/genre.dart';

class GetAllGenresDatasource implements GetAllGenresRepository {
  final Isar _isar;
  GetAllGenresDatasource(this._isar);
  @override
  Future<ErrorHandler<List<GenreEntity>>> call() {
    try {
      return Future(() => right(_isar.txnSync(() => _isar.genres
          .where()
          .findAllSync()
          .map((genre) => GenreDto.fromIsar(genre))
          .toList())));
    } on Exception catch (_, s) {
      return Future(() => left(s.toString()));
    }
  }
}
