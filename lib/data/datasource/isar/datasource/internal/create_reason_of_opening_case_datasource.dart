import 'package:fpdart/fpdart.dart';
import 'package:isar/isar.dart';

import '../../../../../core/error_handler.dart';
import '../../../../../domain/entity/reasons_of_opening_case/reason_of_opening_case_entity.dart';
import '../../../../dto/reasons_of_opening_cases/reasons_of_opening_case_dto.dart';
import '../../model/reasons_of_opening_case/reason_of_opening_case.dart';

class CreateReasonOfOpeningCaseDatasource {
  final Isar _isar;
  CreateReasonOfOpeningCaseDatasource(this._isar);
  Future<ErrorHandler<int>> call(ReasonOfOpeningCaseEntity reasonOfOpeningCaseEntity) {
    try {
      return Future(() => right(_isar.writeTxnSync(() => _isar.reasonOfOpeningCases
          .putSync(ReasonOfOpeningCaseDto.fromEntity(reasonOfOpeningCaseEntity)))));
    } on Exception catch (_, e) {
      return Future(() => left(e.toString()));
    }
  }
}
