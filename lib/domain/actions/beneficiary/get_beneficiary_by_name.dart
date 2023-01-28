import 'package:biosp/core/error_handler.dart';
import 'package:biosp/domain/entity/beneficiaries/beneficiary_entity.dart';
import 'package:biosp/domain/repository/get_beneficiary_by_name_repository.dart';

class GetBeneficiaryByName {
  final GetBeneficiaryByNameRepository getBeneficiaryByNameRepository;
  GetBeneficiaryByName({required this.getBeneficiaryByNameRepository});

  Future<ErrorHandler<BeneficiaryEntity>> call(String name) =>
      getBeneficiaryByNameRepository(name);
}
