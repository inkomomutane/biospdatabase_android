import 'package:ulid4d/ulid4d.dart';

import '../../../core/error_handler.dart';
import '../../repository/delete_beneficiary_repository.dart';

class DeleteBeneficiary {
  final DeleteBeneficiaryRepository deleteBeneficiaryRepository;
  DeleteBeneficiary({required this.deleteBeneficiaryRepository});
  Future<ErrorHandler<int>> call(ULID ulid) =>
      deleteBeneficiaryRepository(ulid);
}