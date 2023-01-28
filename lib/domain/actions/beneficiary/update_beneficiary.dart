import 'package:biosp/core/error_handler.dart';
import 'package:biosp/domain/entity/beneficiaries/beneficiary_entity.dart';
import 'package:biosp/domain/repository/update_beneficiary_repository.dart';

class UpdateBeneficiary {
  final UpdateBeneficiaryRepository updateBeneficiaryRepository;
  UpdateBeneficiary({required this.updateBeneficiaryRepository});
  Future<ErrorHandler<BeneficiaryEntity>> call(
          BeneficiaryEntity beneficiaryEntity) =>
      updateBeneficiaryRepository(beneficiaryEntity);
}