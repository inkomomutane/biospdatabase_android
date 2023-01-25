import '../../core/error_handler.dart';
import '../entity/beneficiaries/beneficiary_entity.dart';

abstract class CreateBeneficiaryRepository{
  ErrorHandler<Future<BeneficiaryEntity>> call(BeneficiaryEntity beneficiaryEntity);
}