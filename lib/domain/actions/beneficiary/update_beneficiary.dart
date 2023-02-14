import '../../../core/error_handler.dart';
import '../../entity/beneficiaries/beneficiary_entity.dart';
import '../../repository/update_beneficiary_repository.dart';

class UpdateBeneficiary {
  final UpdateBeneficiaryRepository updateBeneficiaryRepository;
  UpdateBeneficiary({required this.updateBeneficiaryRepository});
  Future<ErrorHandler<int>> call(
          BeneficiaryEntity beneficiaryEntity) =>
      updateBeneficiaryRepository(beneficiaryEntity);
}