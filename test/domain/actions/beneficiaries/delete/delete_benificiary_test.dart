import 'package:biosp/core/error_handler.dart';
import 'package:biosp/domain/actions/beneficiary/delete_benificiary.dart';
import 'package:biosp/domain/repository/delete_beneficiary_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ulid4d/ulid4d.dart';

import '../../../../helpers/helpers.dart';
import 'delete_benificiary_test.mocks.dart';

@GenerateNiceMocks([MockSpec<DeleteBeneficiaryRepository>()])
void main() {
  late final MockDeleteBeneficiaryRepository mockDeleteBeneficiaryRepository;
  late final DeleteBeneficiary deleteBeneficiary;

  late final ULID ulid = ULID.nextULID();
  setUp(() {
    mockDeleteBeneficiaryRepository = MockDeleteBeneficiaryRepository();
    deleteBeneficiary = DeleteBeneficiary(
        deleteBeneficiaryRepository: mockDeleteBeneficiaryRepository);
  });
  test('it repository should return delete beneficiary by ulid.', () async {
    when(mockDeleteBeneficiaryRepository(ulid)).thenAnswer((answer) =>
        Future(() => ErrorHandler.right(beneficiaryEntityTestTrait())));

    final beneficiaryEntity = await deleteBeneficiary(ulid);

    beneficiaryEntity.fold(
        (l) => null, (r) => expect((r) == beneficiaryEntityTestTrait(), true));
  });
}
