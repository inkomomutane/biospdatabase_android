import 'package:biosp/core/error_handler.dart';
import 'package:biosp/domain/actions/beneficiary/get_beneficiaries.dart';
import 'package:biosp/domain/repository/get_beneficiaries_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../../../helpers/helpers.dart';
import 'get_beneficiaries_test.mocks.dart';

@GenerateNiceMocks([MockSpec<GetBeneficiariesRepository>()])
void main() {
  late final MockGetBeneficiariesRepository mockGetBeneficiariesRepository;
  late final GetBeneficiaries getBeneficiaries;
  setUp(() {
    mockGetBeneficiariesRepository = MockGetBeneficiariesRepository();
    getBeneficiaries = GetBeneficiaries(
        getBeneficiariesRepository: mockGetBeneficiariesRepository);
  });
  test('it should return all beneficiaries.', () async {
    when(mockGetBeneficiariesRepository()).thenAnswer((answer) =>
        Future(() => ErrorHandler.right(listOfBeneficiaryEntityTestTrait())));

    final beneficiaryEntities = await getBeneficiaries();

    beneficiaryEntities.fold(
        (l) => null,
        (r) => expect(
            (r).first == listOfBeneficiaryEntityTestTrait().first, true));
  });
}
