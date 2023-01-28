import '../../../core/error_handler.dart';
import '../../entity/forwarded_services/forwarded_service_entity.dart';
import '../../repository/get_all_forwarded_services_repository.dart';

class GetAllForwardedServices {
  final GetAllForwardedServicesRepository _getAllForwardedServicesRepository;
  GetAllForwardedServices(this._getAllForwardedServicesRepository);

  Future<ErrorHandler<List<ForwardedServiceEntity>>> call() =>
      _getAllForwardedServicesRepository();
}
