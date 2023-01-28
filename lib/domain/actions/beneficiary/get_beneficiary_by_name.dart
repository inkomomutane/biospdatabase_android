import '../../../core/error_handler.dart';
import '../../entity/beneficiaries/beneficiary_entity.dart';
import '../../repository/get_beneficiary_by_name_repository.dart';

class GetBeneficiaryByName {
  final GetBeneficiaryByNameRepository getBeneficiaryByNameRepository;
  GetBeneficiaryByName({required this.getBeneficiaryByNameRepository});

  Future<ErrorHandler<BeneficiaryEntity>> call(String name) =>
      getBeneficiaryByNameRepository(name);
}
