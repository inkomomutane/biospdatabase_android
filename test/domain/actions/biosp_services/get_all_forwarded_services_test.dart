import 'package:biosp/core/error_handler.dart';
import 'package:biosp/domain/actions/biosp_services/get_all_forwarded_services.dart';
import 'package:biosp/domain/entity/forwarded_services/forwarded_service_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ulid4d/ulid4d.dart';

import '../../repositories/biosp_services/forwarded_services/get_all_forwarded_services_repository_test.mocks.dart';

void main() {
  late final MockGetAllForwardedServicesRepository
      mockGetAllForwardedServicesRepository;
  late final GetAllForwardedServices getAllForwardedServices;
  late final String name;
  late final ULID ulid;
  setUp(() {
    mockGetAllForwardedServicesRepository =
        MockGetAllForwardedServicesRepository();
    getAllForwardedServices =
        GetAllForwardedServices(mockGetAllForwardedServicesRepository);
    name = 'Male';
    ulid = ULID.nextULID();
  });
  test('it should get all forwarded services', () async {
    when(mockGetAllForwardedServicesRepository()).thenAnswer(
      (answer) async => ErrorHandler.right(
        [ForwardedServiceEntity(ulid: ulid, name: name)],
      ),
    );
    final forwardedServiceEntities = await getAllForwardedServices();
    forwardedServiceEntities.fold((l) => null, (r) async {
      expect((r).first, ForwardedServiceEntity(ulid: ulid, name: name));
    });
  });
}
