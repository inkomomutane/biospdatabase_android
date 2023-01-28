import 'package:biosp/core/error_handler.dart';
import 'package:biosp/domain/entity/biosps/biosp_entity.dart';

abstract class GetAllBiospsRepository {
  Future<ErrorHandler<List<BiospEntity>>> call();
}