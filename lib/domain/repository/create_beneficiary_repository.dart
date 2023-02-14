import '../../core/error_handler.dart';
import '../entity/beneficiaries/beneficiary_entity.dart';

abstract class CreateBeneficiaryRepository{
  Future<ErrorHandler<int>> call(BeneficiaryEntity beneficiaryEntity);
}