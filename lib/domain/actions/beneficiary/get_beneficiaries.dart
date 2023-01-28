import 'package:biosp/core/error_handler.dart';
import 'package:biosp/domain/entity/beneficiaries/beneficiary_entity.dart';
import 'package:biosp/domain/repository/get_beneficiaries_repository.dart';

class GetBeneficiaries {
  final GetBeneficiariesRepository getBeneficiariesRepository;
  GetBeneficiaries({required this.getBeneficiariesRepository});
  Future<ErrorHandler<List<BeneficiaryEntity>>> call() =>
      getBeneficiariesRepository();
}