import '../../../core/error_handler.dart';
import '../../entity/reasons_of_opening_case/reason_of_opening_case_entity.dart';
import '../../repository/get_all_reasons_of_opening_case_repository.dart';

class GetAllReasonOfOpeningCases {
  final GetAllReasonOfOpeningCasesRepository _allReasonOfOpeningCasesRepository;
  GetAllReasonOfOpeningCases(this._allReasonOfOpeningCasesRepository);
  Future<ErrorHandler<List<ReasonOfOpeningCaseEntity>>> call() =>
      _allReasonOfOpeningCasesRepository();
}