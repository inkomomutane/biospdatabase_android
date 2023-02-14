import 'package:fpdart/fpdart.dart';
import 'package:isar/isar.dart';

import '../../../../../core/error_handler.dart';
import '../../../../../domain/entity/genres/genre_entity.dart';
import '../../../../dto/genres/genre_dto.dart';
import '../../model/genres/genre.dart';

class CreateGenreDatasource {
  final Isar _isar;
  CreateGenreDatasource(this._isar);
  Future<ErrorHandler<int>> call(GenreEntity genreEntity) async {
    try {
      return right(
        _isar.writeTxnSync(
          () => _isar.genres.putSync(
            GenreDto.fromEntity(genreEntity),
          ),
        ),
      );
    } on Exception catch (_, e) {
      return left(e.toString());
    }
  }
}
