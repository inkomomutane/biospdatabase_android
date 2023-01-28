import 'package:biosp/core/error_handler.dart';
import 'package:biosp/domain/entity/beneficiaries/beneficiary_entity.dart';
import 'package:biosp/domain/repository/get_beneficiary_by_id_repository.dart';
import 'package:ulid4d/ulid4d.dart';

class GetBeneficiaryById {
  final GetBeneficiaryByIdRepository getBeneficiaryByIdRepository;

  GetBeneficiaryById({required this.getBeneficiaryByIdRepository});
  Future<ErrorHandler<BeneficiaryEntity>> call(ULID ulid) =>
      getBeneficiaryByIdRepository(ulid);
}
