import 'package:fpdart/fpdart.dart';
import 'package:isar/isar.dart';

import '../../../../core/error_handler.dart';
import '../../../../domain/entity/beneficiaries/beneficiary_entity.dart';
import '../../../../domain/repository/get_beneficiary_by_name_repository.dart';
import '../../../dto/beneficiaries/beneficiary_dto.dart';
import '../model/beneficiaries/beneficiary.dart';

class GetBeneficiaryByNameDatasource implements GetBeneficiaryByNameRepository {
  final Isar _isar;
  GetBeneficiaryByNameDatasource(this._isar);

  @override
  Future<ErrorHandler<BeneficiaryEntity>> call(String name) async {
    try {
      return right(_isar.txnSync(() {
        final beneficiary = _isar.beneficiaries
            .filter()
            .fullNameEqualTo(name, caseSensitive: false)
            .findFirstSync();
        beneficiary!.biosp.loadSync();
        beneficiary.documentType.loadSync();
        beneficiary.forwardedService.loadSync();
        beneficiary.genre.loadSync();
        beneficiary.provenance.loadSync();
        beneficiary.reasonOfOpeningCase.loadSync();
        beneficiary.purposeOfVisit.loadSync();
        return BeneficiaryDto.fromIsar(beneficiary);
      }));
    } on Exception catch (_, e) {
      return left(e.toString());
    }
  }
}
