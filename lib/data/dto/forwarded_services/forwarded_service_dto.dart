import '../../../core/inject.dart';
import 'package:ulid4d/ulid4d.dart';

import '../../../domain/entity/forwarded_services/forwarded_service_entity.dart';
import '../../datasource/isar/model/forwarded_services/forwarded_service.dart';

abstract class ForwardedServiceDto {
  static ForwardedServiceEntity fromIsar(ForwardedService? forwardedService) =>
      ForwardedServiceEntity(
        ulid: ULID.fromString(forwardedService!.ulid),
        name: forwardedService.name,
        id: forwardedService.id,
      );
  static ForwardedService fromEntity(
          ForwardedServiceEntity? forwardedServiceEntity) =>
      ForwardedService()
        ..id = forwardedServiceEntity!.id
        ..name = forwardedServiceEntity.name
        ..ulid = forwardedServiceEntity.ulid.toString();
  static ForwardedService fromGraphql(Map<String,dynamic> graphql) => ForwardedService()
    ..name = graphql['name']..ulid =  Inject.toUppercase(graphql['ulid'] as String);
}
