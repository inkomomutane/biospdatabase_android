import 'package:fpdart/fpdart.dart';
import 'package:isar/isar.dart';

import '../../../../../core/error_handler.dart';
import '../../../../../domain/entity/biosps/biosp_entity.dart';
import '../../../../dto/biosps/biosp_dto.dart';
import '../../model/biosps/biosp.dart';

class CreateBiospDatasource {
  final Isar _isar;
  CreateBiospDatasource(this._isar);
  Future<ErrorHandler<int>> call(BiospEntity biospEntity) async {
    try {
      return right(
        _isar.writeTxnSync(
          () => _isar.biosps.putSync(
            BiospDto.fromEntity(biospEntity),
          ),
        ),
      );
    } on Exception catch (_, s) {
      return left(s.toString());
    }
  }
}
