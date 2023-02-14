import 'package:ulid4d/ulid4d.dart';

import '../../core/error_handler.dart';

abstract class DeleteBeneficiaryRepository {
  Future<ErrorHandler<int>> call(ULID ulid);
}
