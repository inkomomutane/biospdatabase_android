import 'package:biosp/core/error_handler.dart';
import 'package:biosp/domain/actions/beneficiary/update_beneficiary.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../../../helpers/helpers.dart';
import '../../../repositories/beneficiaries/update/update_beneficiary_repository_test.mocks.dart';

void main() {
  late final MockUpdateBeneficiaryRepository mockUpdateBeneficiaryRepository;
  late final UpdateBeneficiary updateBeneficiary;

  setUp(() {
    mockUpdateBeneficiaryRepository = MockUpdateBeneficiaryRepository();
    updateBeneficiary = UpdateBeneficiary(
        updateBeneficiaryRepository: mockUpdateBeneficiaryRepository);
  });
  test('it should return update beneficiary', () async {
    when(
      mockUpdateBeneficiaryRepository(
        beneficiaryEntityTestTrait(),
      ),
    ).thenAnswer(
      (answer) async => ErrorHandler.right(1),
    );
    final beneficiaryEntity =
        await updateBeneficiary(beneficiaryEntityTestTrait());
    beneficiaryEntity.fold((l) => null, (r) => expect((r) == 1, true));
  });
}
