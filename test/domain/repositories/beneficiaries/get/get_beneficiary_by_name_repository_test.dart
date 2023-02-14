import 'package:biosp/core/error_handler.dart';
import 'package:biosp/domain/repository/get_beneficiary_by_name_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../../../helpers/helpers.dart';
import 'get_beneficiary_by_name_repository_test.mocks.dart';

@GenerateNiceMocks([MockSpec<GetBeneficiaryByNameRepository>()])
void main() {
  late final MockGetBeneficiaryByNameRepository
      mockGetBeneficiaryByNameRepository;
  const String name = "Jane Doe";
  setUp(() {
    mockGetBeneficiaryByNameRepository = MockGetBeneficiaryByNameRepository();
  });
  test('it repository should get beneficiary by name.', () async {
    when(mockGetBeneficiaryByNameRepository(name)).thenAnswer(
      (answer) async => ErrorHandler.right(
        beneficiaryEntityTestTrait(),
      ),
    );
    final beneficiaryEntity = await mockGetBeneficiaryByNameRepository(name);

    beneficiaryEntity.fold(
        (l) => null, (r) => expect((r) == beneficiaryEntityTestTrait(), true));
  });
}
