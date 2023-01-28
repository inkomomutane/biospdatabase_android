import '../../../core/error_handler.dart';
import '../../entity/beneficiaries/beneficiary_entity.dart';
import '../../repository/get_beneficiaries_repository.dart';

class GetBeneficiaries {
  final GetBeneficiariesRepository getBeneficiariesRepository;
  GetBeneficiaries({required this.getBeneficiariesRepository});
  Future<ErrorHandler<List<BeneficiaryEntity>>> call() =>
      getBeneficiariesRepository();
}