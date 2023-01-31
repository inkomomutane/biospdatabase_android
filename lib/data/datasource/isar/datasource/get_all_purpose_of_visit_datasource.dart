import '../../../../core/error_handler.dart';
import '../model/purposes_of_visit/purpose_of_visit.dart';
import '../../../dto/purpose_of_visits/purpose_of_visit_dto.dart';
import '../../../../domain/entity/purposes_of_visit/purpose_of_visit_entity.dart';
import '../../../../domain/repository/get_all_purpuse_of_visits_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:isar/isar.dart';

class GetAllPurposeOfVisitsDatasource extends GetAllPurposeOfVisitsRepository {
  final Isar _isar;
  GetAllPurposeOfVisitsDatasource(this._isar);
  @override
  Future<ErrorHandler<List<PurposeOfVisitEntity>>> call() {
    try {
      return Future(() => right(_isar
          .txnSync(() => _isar.purposeOfVisits.where().findAllSync())
          .map((biosp) => PurposeOfVisitDto.fromIsar(biosp))
          .toList()));
    } on Exception catch (_, e) {
      return Future(() => left(e.toString()));
    }
  }
}
