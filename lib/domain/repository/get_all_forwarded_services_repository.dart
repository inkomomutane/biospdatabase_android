import '../../core/error_handler.dart';
import '../entity/forwarded_services/forwarded_service_entity.dart';

abstract class GetAllForwardedServicesRepository {
  Future<ErrorHandler<List<ForwardedServiceEntity>>> call();
}
