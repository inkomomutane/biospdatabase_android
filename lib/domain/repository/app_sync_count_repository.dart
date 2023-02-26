import '../../core/error_handler.dart';

abstract class AppSyncCountRepository {
  Future<ErrorHandler<int>> call();
}