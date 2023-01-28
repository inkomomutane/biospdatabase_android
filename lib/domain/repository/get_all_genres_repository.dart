import '../../core/error_handler.dart';
import '../entity/genres/genre_entity.dart';

abstract class GetAllGenresRepository {
  Future<ErrorHandler<List<GenreEntity>>> call();
}