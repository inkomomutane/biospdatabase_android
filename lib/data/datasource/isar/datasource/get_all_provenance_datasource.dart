import 'package:fpdart/fpdart.dart';
import 'package:isar/isar.dart';

import '../../../../core/error_handler.dart';
import '../../../../domain/entity/provenances/provenance_entity.dart';
import '../../../../domain/repository/get_all_provenance_repository.dart';
import '../../../dto/provenances/provenance_dto.dart';
import '../model/provenances/provenance.dart';

class GetAllProvenancesDatasource implements GetAllProvenancesRepository {
  final Isar _isar;
  GetAllProvenancesDatasource(this._isar);
  @override
  Future<ErrorHandler<List<ProvenanceEntity>>> call() async {
    try {
      return right(_isar.txnSync(() => _isar.provenances
          .where()
          .findAllSync()
          .map((provenance) => ProvenanceDto.fromIsar(provenance))
          .toList()));
    } on Exception catch (_, s) {
      return left(s.toString());
    }
  }
}
