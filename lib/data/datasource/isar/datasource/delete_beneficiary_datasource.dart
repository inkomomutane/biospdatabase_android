import 'package:fpdart/fpdart.dart';
import 'package:isar/isar.dart';
import 'package:ulid4d/ulid4d.dart';

import '../../../../core/enums.dart';
import '../../../../core/error_handler.dart';
import '../../../../domain/repository/delete_beneficiary_repository.dart';
import '../model/beneficiaries/beneficiary.dart';
import '../model/sync.dart';

class DeleteBeneficiaryDatasource implements DeleteBeneficiaryRepository {
  final Isar _isar;
  DeleteBeneficiaryDatasource(this._isar);

  @override
  Future<ErrorHandler<int>> call(ULID ulid) async {
    try {
      return right(
        _isar.writeTxnSync(
          () {
            final r = _isar.beneficiaries
                .filter()
                .ulidEqualTo(ulid.toString(), caseSensitive: false)
                .deleteAllSync();
            LWinMapSync(
              operation: SyncOperations.deleted,
              ulid: ulid.toString(),
              operationDateTime: DateTime.now(),
            );
            return r;
          },
        ),
      );
    } on Exception catch (_, e) {
      return left(e.toString());
    }
  }
}
