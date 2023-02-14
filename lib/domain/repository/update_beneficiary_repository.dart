import '../../core/error_handler.dart';
import '../../domain/entity/beneficiaries/beneficiary_entity.dart';

abstract class UpdateBeneficiaryRepository{
  Future<ErrorHandler<int>> call(BeneficiaryEntity beneficiaryEntity);
}