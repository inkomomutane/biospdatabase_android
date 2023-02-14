import 'package:fpdart/fpdart.dart';
import 'package:isar/isar.dart';

import '../../../../../core/error_handler.dart';
import '../../../../../domain/entity/purposes_of_visit/purpose_of_visit_entity.dart';
import '../../../../dto/purpose_of_visits/purpose_of_visit_dto.dart';
import '../../model/purposes_of_visit/purpose_of_visit.dart';

class CreatePurposeOfVisitDatasource {
  final Isar _isar;
  CreatePurposeOfVisitDatasource(this._isar);
  Future<ErrorHandler<int>> call(
      PurposeOfVisitEntity purposeOfVisitEntity) async {
    try {
      return right(
        _isar.writeTxnSync(
          () => _isar.purposeOfVisits.putSync(
            PurposeOfVisitDto.fromEntity(purposeOfVisitEntity),
          ),
        ),
      );
    } on Exception catch (_, e) {
      return left(e.toString());
    }
  }
}
