import '../../core/error_handler.dart';
import '../entity/biosps/biosp_entity.dart';

abstract class GetAllBiospsRepository {
  Future<ErrorHandler<List<BiospEntity>>> call();
}