import '../../core/error_handler.dart';
import '../entity/reasons_of_opening_case/reason_of_opening_case_entity.dart';

abstract class GetAllReasonOfOpeningCasesRepository {
  Future<ErrorHandler<List<ReasonOfOpeningCaseEntity>>> call();
}