import 'package:biosp/core/error_handler.dart';
import 'package:biosp/domain/entity/biosps/biosp_entity.dart';
import 'package:biosp/domain/repository/get_all_biops_repository.dart';

class GetAllBiosps {
  final GetAllBiospsRepository _getAllBiospsRepository;
  GetAllBiosps(this._getAllBiospsRepository);
  Future<ErrorHandler<List<BiospEntity>>> call() => _getAllBiospsRepository();
}
