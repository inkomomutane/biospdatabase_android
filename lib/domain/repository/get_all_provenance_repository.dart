import 'package:biosp/core/error_handler.dart';
import 'package:biosp/domain/entity/provenances/provenance_entity.dart';

abstract class GetAllProvenancesRepository {
  Future<ErrorHandler<List<ProvenanceEntity>>> call();
}