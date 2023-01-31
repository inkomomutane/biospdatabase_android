import '../../../../../core/error_handler.dart';
import '../../model/provenances/provenance.dart';
import '../../../../dto/provenances/provenance_dto.dart';
import '../../../../../domain/entity/provenances/provenance_entity.dart';
import 'package:fpdart/fpdart.dart';
import 'package:isar/isar.dart';

class CreateProvenanceDatasource {
  final Isar _isar;
  CreateProvenanceDatasource(this._isar);
  Future<ErrorHandler<int>> call(ProvenanceEntity provenanceEntity) {
    try {
      return Future(() => right(_isar.writeTxnSync(
          () => _isar.provenances.putSync(ProvenanceDto.fromEntity(provenanceEntity)))));
    } on Exception catch (_, e) {
      return Future(() => left(e.toString()));
    }
  }
}
