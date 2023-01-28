import '../../../core/error_handler.dart';
import '../../entity/purposes_of_visit/purpose_of_visit_entity.dart';
import '../../repository/get_all_purpuse_of_visits_repository.dart';

class GetAllPurposeOfVisits {
  final GetAllPurposeOfVisitsRepository _getAllPurposeOfVisitsRepository;
  GetAllPurposeOfVisits(this._getAllPurposeOfVisitsRepository);
  Future<ErrorHandler<List<PurposeOfVisitEntity>>> call() =>
      _getAllPurposeOfVisitsRepository();
}
