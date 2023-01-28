import '../../core/error_handler.dart';
import '../entity/purposes_of_visit/purpose_of_visit_entity.dart';

abstract class GetAllPurposeOfVisitsRepository {
  Future<ErrorHandler<List<PurposeOfVisitEntity>>> call();
}
