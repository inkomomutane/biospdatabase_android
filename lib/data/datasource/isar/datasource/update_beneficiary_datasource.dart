import 'package:fpdart/fpdart.dart';
import 'package:isar/isar.dart';

import '../../../../../core/error_handler.dart';
import '../../../../../domain/entity/beneficiaries/beneficiary_entity.dart';
import '../../../../core/enums.dart';
import '../../../../domain/repository/update_beneficiary_repository.dart';
import '../../../dto/beneficiaries/beneficiary_dto.dart';
import '../model/beneficiaries/beneficiary.dart';
import '../model/sync.dart';

class UpdateBeneficiaryDatasource implements UpdateBeneficiaryRepository {
  final Isar _isar;
  UpdateBeneficiaryDatasource(this._isar);

  @override
  Future<ErrorHandler<int>> call(BeneficiaryEntity beneficiaryEntity) async {
    try {
      return right(
        _isar.writeTxnSync(
          () {
            final r = _isar.beneficiaries.putSync(
              BeneficiaryDto.fromEntity(beneficiaryEntity),
            );
            LWinMapSync(
              operation: SyncOperations.updated,
              ulid: beneficiaryEntity.ulid.toString(),
              operationDateTime: DateTime.now(),
            );
            return r;
          },
        ),
      );
    } on Exception catch (_, e) {
      return left(e.toString());
    }
  }
}
