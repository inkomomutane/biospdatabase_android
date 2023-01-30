import '../../../../core/error_handler.dart';
import '../model/beneficiaries/beneficiary.dart';
import '../../../dto/beneficiaries/beneficiary_dto.dart';
import '../../../../domain/entity/beneficiaries/beneficiary_entity.dart';
import '../../../../domain/repository/get_beneficiaries_repository.dart';
import 'package:isar/isar.dart';

class GetBeneficiariesResource implements GetBeneficiariesRepository {
  final Isar _isar;
  GetBeneficiariesResource(this._isar);
  @override
  Future<ErrorHandler<List<BeneficiaryEntity>>> call() {
    try {
      return Future(() => ErrorHandler.right(_isar
          .txnSync(() => _isar.beneficiaries.where().findAllSync())
          .map((beneficiary) => BeneficiaryDto.fromIsar(beneficiary))
          .toList()));
    } catch (e) {
      return Future(() => ErrorHandler.left("$e"));
    }
  }
}
