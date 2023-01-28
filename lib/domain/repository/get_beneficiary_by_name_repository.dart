import '../../core/error_handler.dart';
import '../entity/beneficiaries/beneficiary_entity.dart';

abstract class GetBeneficiaryByNameRepository {
  Future<ErrorHandler<BeneficiaryEntity>> call(String name);
}