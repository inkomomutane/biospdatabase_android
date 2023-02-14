import 'package:biosp/domain/repository/create_beneficiary_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:isar/isar.dart';

import '../../../../../core/error_handler.dart';
import '../../../../../domain/entity/beneficiaries/beneficiary_entity.dart';
import '../../../dto/beneficiaries/beneficiary_dto.dart';
import '../model/beneficiaries/beneficiary.dart';

class CreateBeneficiaryDatasource implements CreateBeneficiaryRepository {
  final Isar _isar;
  CreateBeneficiaryDatasource(this._isar);

  @override
  Future<ErrorHandler<int>> call(BeneficiaryEntity beneficiaryEntity) async {
    try {
      return right(
        _isar.writeTxnSync(
          () => _isar.beneficiaries.putSync(
            BeneficiaryDto.fromEntity(beneficiaryEntity),
          ),
        ),
      );
    } on Exception catch (_, e) {
      return left(e.toString());
    }
  }
}
