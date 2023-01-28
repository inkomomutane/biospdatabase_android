import '../../core/error_handler.dart';
import '../entity/beneficiaries/beneficiary_entity.dart';

abstract class GetBeneficiariesRepository {
  Future<ErrorHandler<List<BeneficiaryEntity>>> call();
}