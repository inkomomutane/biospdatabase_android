import 'package:biosp/core/error_handler.dart';
import 'package:biosp/domain/entity/beneficiaries/beneficiary_entity.dart';
import 'package:ulid4d/ulid4d.dart';

abstract class GetBeneficiaryByIdRepository{
  ErrorHandler<Future<BeneficiaryEntity>> call(ULID ulid);
}