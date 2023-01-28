import '../../core/error_handler.dart';
import '../entity/provenances/provenance_entity.dart';

abstract class GetAllProvenancesRepository {
  Future<ErrorHandler<List<ProvenanceEntity>>> call();
}