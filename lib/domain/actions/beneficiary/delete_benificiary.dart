import 'package:biosp/core/error_handler.dart';
import 'package:biosp/domain/entity/beneficiaries/beneficiary_entity.dart';
import 'package:biosp/domain/repository/delete_beneficiary_repository.dart';
import 'package:ulid4d/ulid4d.dart';

class DeleteBeneficiary {
  final DeleteBeneficiaryRepository deleteBeneficiaryRepository;
  DeleteBeneficiary({required this.deleteBeneficiaryRepository});
  Future<ErrorHandler<BeneficiaryEntity>> call(ULID ulid) =>
      deleteBeneficiaryRepository(ulid);
}