import 'package:biosp/core/error_handler.dart';
import 'package:biosp/domain/actions/beneficiary/update_beneficiary.dart';
import 'package:biosp/domain/repository/update_beneficiary_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../../../helpers/helpers.dart';
import 'update_beneficiary_test.mocks.dart';

@GenerateNiceMocks([MockSpec<UpdateBeneficiaryRepository>()])
void main() {
  late final MockUpdateBeneficiaryRepository mockUpdateBeneficiaryRepository;
  late final UpdateBeneficiary updateBeneficiary;

  setUp(() {
    mockUpdateBeneficiaryRepository = MockUpdateBeneficiaryRepository();
    updateBeneficiary = UpdateBeneficiary(
        updateBeneficiaryRepository: mockUpdateBeneficiaryRepository);
  });
  test('it should return update beneficiary', () async {
    when(mockUpdateBeneficiaryRepository(beneficiaryEntityTestTrait()))
        .thenAnswer((answer) =>
            Future(() => ErrorHandler.right(beneficiaryEntityTestTrait())));
    final beneficiaryEntity =
        await updateBeneficiary(beneficiaryEntityTestTrait());
    beneficiaryEntity.fold(
        (l) => null, (r) => expect((r) == beneficiaryEntityTestTrait(), true));
  });
}
