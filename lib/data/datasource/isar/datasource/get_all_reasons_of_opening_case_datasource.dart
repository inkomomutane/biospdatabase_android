import 'package:fpdart/fpdart.dart';
import 'package:isar/isar.dart';

import '../../../../core/error_handler.dart';
import '../../../../domain/entity/reasons_of_opening_case/reason_of_opening_case_entity.dart';
import '../../../../domain/repository/get_all_reasons_of_opening_case_repository.dart';
import '../../../dto/reasons_of_opening_cases/reasons_of_opening_case_dto.dart';
import '../model/reasons_of_opening_case/reason_of_opening_case.dart';

class GetAllReasonOfOpeningCasesDatasource extends GetAllReasonOfOpeningCasesRepository {
  final Isar _isar;
  GetAllReasonOfOpeningCasesDatasource(this._isar);
  @override
  Future<ErrorHandler<List<ReasonOfOpeningCaseEntity>>> call() {
    try {
      return Future(() => right(_isar
          .txnSync(() => _isar.reasonOfOpeningCases.where().findAllSync())
          .map((biosp) => ReasonOfOpeningCaseDto.fromIsar(biosp))
          .toList()));
    } on Exception catch (_, e) {
      return Future(() => left(e.toString()));
    }
  }
}
