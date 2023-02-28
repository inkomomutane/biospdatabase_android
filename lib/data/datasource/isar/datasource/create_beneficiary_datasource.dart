import 'package:biosp/core/constants.dart';
import 'package:biosp/data/datasource/isar/model/sync.dart';
import 'package:fpdart/fpdart.dart';
import 'package:isar/isar.dart';

import '../../../../../core/error_handler.dart';
import '../../../../../domain/entity/beneficiaries/beneficiary_entity.dart';
import '../../../../domain/repository/create_beneficiary_repository.dart';
import '../../../dto/beneficiaries/beneficiary_dto.dart';
import '../model/beneficiaries/beneficiary.dart';

class CreateBeneficiaryDatasource implements CreateBeneficiaryRepository {
  final Isar _isar;
  CreateBeneficiaryDatasource(this._isar);

  @override
  Future<ErrorHandler<int>> call(BeneficiaryEntity beneficiaryEntity) async {
    try {
      return right(
        _isar.writeTxnSync(() {
          final r = _isar.beneficiaries.putSync(
            BeneficiaryDto.fromEntity(beneficiaryEntity),
          );
          _isar.lWinMapSyncs.putSync(
            LWinMapSync(
              operation: SyncOperations.created,
              ulid: beneficiaryEntity.ulid.toString(),
              operationDateTime: DateTime.now(),
            ),
          );
          return r;
        }),
      );
    } on Exception catch (_, e) {
      return left(e.toString());
    }
  }
}
