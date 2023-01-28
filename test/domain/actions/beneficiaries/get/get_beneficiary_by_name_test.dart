import 'package:biosp/core/error_handler.dart';
import 'package:biosp/domain/actions/beneficiary/get_beneficiary_by_name.dart';
import 'package:biosp/domain/repository/get_beneficiary_by_name_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../../../helpers/helpers.dart';
import 'get_beneficiary_by_name_test.mocks.dart';

@GenerateNiceMocks([MockSpec<GetBeneficiaryByNameRepository>()])
void main() {
  late final MockGetBeneficiaryByNameRepository
      mockGetBeneficiaryByNameRepository;
  late final GetBeneficiaryByName getBeneficiaryByName;
  const String name = "Jane Doe";

  setUp(() {
    mockGetBeneficiaryByNameRepository = MockGetBeneficiaryByNameRepository();
    getBeneficiaryByName = GetBeneficiaryByName(
        getBeneficiaryByNameRepository: mockGetBeneficiaryByNameRepository);
  });

  test('it repository should get beneficiary by name.', () async {
    when(mockGetBeneficiaryByNameRepository(name)).thenAnswer((answer) =>
        Future(() => ErrorHandler.right(beneficiaryEntityTestTrait())));
    final beneficiaryEntity = await getBeneficiaryByName(name);

    beneficiaryEntity.fold(
        (l) => null, (r) => expect((r) == beneficiaryEntityTestTrait(), true));
  });
}
