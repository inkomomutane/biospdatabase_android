import 'package:fpdart/fpdart.dart';
import 'package:isar/isar.dart';

import '../../../../core/error_handler.dart';
import '../../../../domain/entity/beneficiaries/beneficiary_entity.dart';
import '../../../../domain/repository/get_beneficiaries_repository.dart';
import '../../../dto/beneficiaries/beneficiary_dto.dart';
import '../model/beneficiaries/beneficiary.dart';

class GetBeneficiariesResource implements GetBeneficiariesRepository {
  final Isar _isar;

  GetBeneficiariesResource(this._isar);

  @override
  Future<ErrorHandler<List<BeneficiaryEntity>>> call() async {
    try {
      return Future(() => right(_isar
          .txnSync(() => _isar.beneficiaries.where().findAllSync())
          .map((beneficiary) => BeneficiaryDto.fromIsar(beneficiary))
          .toList()));
    } on Exception catch (_,e) {
      return Future(() => left(e.toString()));
    }
  }
}
