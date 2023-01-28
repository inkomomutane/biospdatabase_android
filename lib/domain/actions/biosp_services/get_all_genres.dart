import '../../../core/error_handler.dart';
import '../../entity/genres/genre_entity.dart';
import '../../repository/get_all_genres_repository.dart';

class GetAllGenres {
  final GetAllGenresRepository _getAllGenresRepository;
  GetAllGenres(this._getAllGenresRepository);
  Future<ErrorHandler<List<GenreEntity>>> call() => _getAllGenresRepository();
}
