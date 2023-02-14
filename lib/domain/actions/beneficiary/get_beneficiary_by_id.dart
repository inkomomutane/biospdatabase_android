import 'package:ulid4d/ulid4d.dart';

import '../../../core/error_handler.dart';
import '../../entity/beneficiaries/beneficiary_entity.dart';
import '../../repository/get_beneficiary_by_ulid_repository.dart';

class GetBeneficiaryByUlid {
  final GetBeneficiaryByUlidRepository getBeneficiaryByUlidRepository;

  GetBeneficiaryByUlid({required this.getBeneficiaryByUlidRepository});
  Future<ErrorHandler<BeneficiaryEntity>> call(ULID ulid) =>
      getBeneficiaryByUlidRepository(ulid);
}
