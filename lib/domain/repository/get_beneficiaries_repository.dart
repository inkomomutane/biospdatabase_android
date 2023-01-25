import 'package:biosp/core/error_handler.dart';
import 'package:biosp/domain/entity/beneficiaries/beneficiary_entity.dart';

abstract class GetBeneficiariesRepository {
  ErrorHandler<Future<List<BeneficiaryEntity>>> call();
}