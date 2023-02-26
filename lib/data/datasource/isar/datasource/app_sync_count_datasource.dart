import 'package:biosp/core/error_handler.dart';
import 'package:biosp/data/datasource/isar/model/sync.dart';
import 'package:fpdart/fpdart.dart';
import 'package:isar/isar.dart';

import '../../../../domain/repository/app_sync_count_repository.dart';

class AppSyncCountDatasource extends AppSyncCountRepository {
  final Isar _isar;
  AppSyncCountDatasource(this._isar);
  @override
  Future<ErrorHandler<int>> call() async {
    try {
      return right(
        _isar.txnSync(
          () => _isar.lWinMapSyncs.countSync(),
        ),
      );
    } on Exception catch (_, error) {
      return left(
        error.toString(),
      );
    }
  }
}
