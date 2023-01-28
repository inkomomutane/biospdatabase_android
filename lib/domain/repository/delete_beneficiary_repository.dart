import 'package:ulid4d/ulid4d.dart';
import '../../core/error_handler.dart';
import '../entity/beneficiaries/beneficiary_entity.dart';

abstract class DeleteBeneficiaryRepository {
  Future<ErrorHandler<BeneficiaryEntity>> call(ULID ulid);
}
