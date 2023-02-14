import 'package:fpdart/fpdart.dart';
import 'package:isar/isar.dart';

import '../../../../core/error_handler.dart';
import '../../../../domain/entity/forwarded_services/forwarded_service_entity.dart';
import '../../../../domain/repository/get_all_forwarded_services_repository.dart';
import '../../../dto/forwarded_services/forwarded_service_dto.dart';
import '../model/forwarded_services/forwarded_service.dart';

class GetAllForwardedServicesDatasource
    extends GetAllForwardedServicesRepository {
  final Isar _isar;
  GetAllForwardedServicesDatasource(this._isar);
  @override
  Future<ErrorHandler<List<ForwardedServiceEntity>>> call() async {
    try {
      return right(_isar
          .txnSync(() => _isar.forwardedServices.where().findAllSync())
          .map((biosp) => ForwardedServiceDto.fromIsar(biosp))
          .toList());
    } on Exception catch (_, e) {
      return left(e.toString());
    }
  }
}
