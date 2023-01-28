import 'package:biosp/core/error_handler.dart';
import 'package:biosp/domain/actions/beneficiary/create_beneficiary.dart';
import 'package:biosp/domain/repository/create_beneficiary_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../../../helpers/helpers.dart';
import 'create_beneficiary_test.mocks.dart';

@GenerateNiceMocks([MockSpec<CreateBeneficiaryRepository>()])
void main() {
  late final MockCreateBeneficiaryRepository mockCreateBeneficiaryRepository;
  late final CreateBeneficiary createBeneficiary;
  setUp(() {
    mockCreateBeneficiaryRepository = MockCreateBeneficiaryRepository();
    createBeneficiary = CreateBeneficiary(
        createBeneficiaryRepository: mockCreateBeneficiaryRepository);
  });
  test('it action should return created beneficiary', () async {
    when(mockCreateBeneficiaryRepository(beneficiaryEntityTestTrait()))
        .thenAnswer((realInvocation) =>
            Future(() => ErrorHandler.right(beneficiaryEntityTestTrait())));

    var task = await createBeneficiary(beneficiaryEntityTestTrait());

    task.fold((l) => null, (r) {
      expect(r == beneficiaryEntityTestTrait(), true);
    });
  });
}
