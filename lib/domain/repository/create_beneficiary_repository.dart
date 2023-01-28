import '../../core/error_handler.dart';
import '../entity/beneficiaries/beneficiary_entity.dart';

abstract class CreateBeneficiaryRepository{
  Future<ErrorHandler<BeneficiaryEntity>> call(BeneficiaryEntity beneficiaryEntity);
}