import '../../../core/error_handler.dart';
import '../../entity/provenances/provenance_entity.dart';
import '../../repository/get_all_provenance_repository.dart';

class GetAllProvenances {
  final GetAllProvenancesRepository _getAllProvenancesRepository;
  GetAllProvenances(this._getAllProvenancesRepository);
  Future<ErrorHandler<List<ProvenanceEntity>>> call() =>
      _getAllProvenancesRepository();
}
