import '../../../core/error_handler.dart';
import '../../entity/beneficiaries/beneficiary_entity.dart';
import '../../repository/create_beneficiary_repository.dart';

class CreateBeneficiary {
  CreateBeneficiaryRepository createBeneficiaryRepository;
  CreateBeneficiary({required this.createBeneficiaryRepository});
  Future<ErrorHandler<BeneficiaryEntity>> call(
          BeneficiaryEntity beneficiaryEntity) =>
      createBeneficiaryRepository(beneficiaryEntity);
}
