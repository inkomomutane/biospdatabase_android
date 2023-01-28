import 'package:biosp/core/error_handler.dart';
import 'package:biosp/domain/entity/beneficiaries/beneficiary_entity.dart';
import 'package:biosp/domain/repository/create_beneficiary_repository.dart';

class CreateBeneficiary {
  CreateBeneficiaryRepository createBeneficiaryRepository;
  CreateBeneficiary({required this.createBeneficiaryRepository});
  Future<ErrorHandler<BeneficiaryEntity>> call(
          BeneficiaryEntity beneficiaryEntity) =>
      createBeneficiaryRepository(beneficiaryEntity);
}
