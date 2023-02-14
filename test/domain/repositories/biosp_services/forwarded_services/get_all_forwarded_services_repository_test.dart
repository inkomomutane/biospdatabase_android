import 'package:biosp/core/error_handler.dart';
import 'package:biosp/domain/entity/forwarded_services/forwarded_service_entity.dart';
import 'package:biosp/domain/repository/get_all_forwarded_services_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ulid4d/ulid4d.dart';

import 'get_all_forwarded_services_repository_test.mocks.dart';

@GenerateNiceMocks([MockSpec<GetAllForwardedServicesRepository>()])
void main() {
  late final MockGetAllForwardedServicesRepository
      mockGetAllForwardedServicesRepository;
  late final String name;
  late final ULID ulid;
  setUp(() {
    mockGetAllForwardedServicesRepository =
        MockGetAllForwardedServicesRepository();
    name = 'Male';
    ulid = ULID.nextULID();
  });
  test('it repository should get all forwarded services', () async {
    when(mockGetAllForwardedServicesRepository()).thenAnswer(
      (answer) async => ErrorHandler.right(
        [ForwardedServiceEntity(ulid: ulid, name: name)],
      ),
    );
    final forwardedServiceEntities =
        await mockGetAllForwardedServicesRepository();
    forwardedServiceEntities.fold((l) => null, (r) async {
      expect((r).first, ForwardedServiceEntity(ulid: ulid, name: name));
    });
  });
}
