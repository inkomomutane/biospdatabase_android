import 'package:fpdart/fpdart.dart';
import 'package:isar/isar.dart';

import '../../../../core/error_handler.dart';
import '../../../../domain/entity/biosps/biosp_entity.dart';
import '../../../../domain/repository/get_all_biosps_repository.dart';
import '../../../dto/biosps/biosp_dto.dart';
import '../model/biosps/biosp.dart';

class GetAllBiospsDatasource implements GetAllBiospsRepository {
  final Isar _isar;
  GetAllBiospsDatasource(this._isar);

  @override
  Future<ErrorHandler<List<BiospEntity>>> call() {
     try {
      return Future(() => right(_isar
          .txnSync(() => _isar.biosps.where().findAllSync())
          .map((biosp) => BiospDto.fromIsar(biosp))
          .toList()));
    } on Exception catch (_, e) {
      return Future(() => left(e.toString()));
    }
  }
}
