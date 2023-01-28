import 'package:ulid4d/ulid4d.dart';

import '../../../core/error_handler.dart';
import '../../entity/beneficiaries/beneficiary_entity.dart';
import '../../repository/get_beneficiary_by_id_repository.dart';

class GetBeneficiaryById {
  final GetBeneficiaryByIdRepository getBeneficiaryByIdRepository;

  GetBeneficiaryById({required this.getBeneficiaryByIdRepository});
  Future<ErrorHandler<BeneficiaryEntity>> call(ULID ulid) =>
      getBeneficiaryByIdRepository(ulid);
}
