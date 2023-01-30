import '../../datasource/isar/model/forwarded_services/forwarded_service.dart';
import '../../../domain/entity/forwarded_services/forwarded_service_entity.dart';
import 'package:ulid4d/ulid4d.dart';
abstract class ForwardedServiceDto {
   static ForwardedServiceEntity fromIsar(ForwardedService? forwardedService)  => ForwardedServiceEntity(ulid: ULID.fromString(forwardedService!.ulid), name: forwardedService.name);
   static ForwardedService fromEntity(ForwardedServiceEntity? forwardedServiceEntity) => ForwardedService()..id = forwardedServiceEntity!.id ..name = forwardedServiceEntity.name..ulid = forwardedServiceEntity.ulid.toString();
}
