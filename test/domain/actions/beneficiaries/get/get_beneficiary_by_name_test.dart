import 'package:biosp/core/error_handler.dart';
import 'package:biosp/domain/actions/beneficiary/get_beneficiary_by_name.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../../../helpers/helpers.dart';
import '../../../repositories/beneficiaries/get/get_beneficiary_by_name_repository_test.mocks.dart';

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

  test('it should get beneficiary by name.', () async {
    when(mockGetBeneficiaryByNameRepository(name)).thenAnswer((answer) =>
        Future(() => ErrorHandler.right(beneficiaryEntityTestTrait())));
    final beneficiaryEntity = await getBeneficiaryByName(name);

    beneficiaryEntity.fold(
        (l) => null, (r) => expect((r) == beneficiaryEntityTestTrait(), true));
  });
}
