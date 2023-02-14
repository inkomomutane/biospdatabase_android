import 'package:fpdart/fpdart.dart';
import 'package:isar/isar.dart';

import '../../../../core/error_handler.dart';
import '../../../../domain/entity/beneficiaries/beneficiary_entity.dart';
import '../../../../domain/repository/get_beneficiaries_repository.dart';
import '../../../dto/beneficiaries/beneficiary_dto.dart';
import '../model/beneficiaries/beneficiary.dart';

class GetAllBeneficiariesDatasource implements GetBeneficiariesRepository {
  final Isar _isar;

  GetAllBeneficiariesDatasource(this._isar);

  @override
  Future<ErrorHandler<List<BeneficiaryEntity>>> call() async {
    try {
      return right(_isar
          .txnSync(() => _isar.beneficiaries.where().findAllSync())
          .map((beneficiary) {
        beneficiary.biosp.loadSync();
        beneficiary.documentType.loadSync();
        beneficiary.forwardedService.loadSync();
        beneficiary.genre.loadSync();
        beneficiary.provenance.loadSync();
        beneficiary.reasonOfOpeningCase.loadSync();
        beneficiary.purposeOfVisit.loadSync();
        return BeneficiaryDto.fromIsar(beneficiary);
      }).toList());
    } on Exception catch (_, e) {
      return left(e.toString());
    }
  }
}
