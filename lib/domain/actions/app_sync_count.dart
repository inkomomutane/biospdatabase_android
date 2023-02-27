
import '../../core/error_handler.dart';
import '../repository/app_sync_count_repository.dart';

class AppSyncCount {
  final AppSyncCountRepository _appSyncCountRepository;
  AppSyncCount(this._appSyncCountRepository);
  Future<ErrorHandler<int>> call() => _appSyncCountRepository();
}
