import 'package:fpdart/fpdart.dart';
import 'package:isar/isar.dart';

import '../../../../../core/error_handler.dart';
import '../../../../../domain/entity/forwarded_services/forwarded_service_entity.dart';
import '../../../../dto/forwarded_services/forwarded_service_dto.dart';
import '../../model/forwarded_services/forwarded_service.dart';

class CreateForwardedServiceDatasource {
  final Isar _isar;
  CreateForwardedServiceDatasource(this._isar);
  Future<ErrorHandler<int>> call(ForwardedServiceEntity forwardedServiceEntity) {
    try {
      return Future(() => right(_isar.writeTxnSync(() => _isar.forwardedServices
          .putSync(ForwardedServiceDto.fromEntity(forwardedServiceEntity)))));
    } on Exception catch (_, e) {
      return Future(() => left(e.toString()));
    }
  }
}
