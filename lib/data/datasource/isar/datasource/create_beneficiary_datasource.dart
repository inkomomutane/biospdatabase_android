import 'package:fpdart/fpdart.dart';
import 'package:isar/isar.dart';

import '../../../../../core/error_handler.dart';
import '../../../../../domain/entity/beneficiaries/beneficiary_entity.dart';
import '../../../dto/beneficiaries/beneficiary_dto.dart';
import '../model/beneficiaries/beneficiary.dart';

class CreateBeneficiaryDatasource {
  final Isar _isar;
  CreateBeneficiaryDatasource(this._isar);
  Future<ErrorHandler<int>> call(BeneficiaryEntity beneficiaryEntity) {
    try {
      return Future(() => right(_isar.writeTxnSync(
          () => _isar.beneficiaries.putSync(BeneficiaryDto.fromEntity(beneficiaryEntity)))));
    } on Exception catch (_, e) {
      return Future(() => left(e.toString()));
    }
  }
}
