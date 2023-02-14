import 'package:biosp/core/error_handler.dart';
import 'package:biosp/domain/repository/delete_beneficiary_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ulid4d/ulid4d.dart';
import 'delete_beneficiary_repository_test.mocks.dart';

@GenerateNiceMocks([MockSpec<DeleteBeneficiaryRepository>()])
void main() {
  late final MockDeleteBeneficiaryRepository mockDeleteBeneficiaryRepository;
  late final ULID ulid = ULID.nextULID();
  setUp(() {
    mockDeleteBeneficiaryRepository = MockDeleteBeneficiaryRepository();
  });
  test('it repository should return delete beneficiary by ulid.', () async {
    when(mockDeleteBeneficiaryRepository(ulid)).thenAnswer(
      (answer) async => ErrorHandler.right(1),
    );
    final beneficiaryEntity = await mockDeleteBeneficiaryRepository(ulid);
    beneficiaryEntity.fold((l) => null, (r) => expect((r) == 1, true));
  });
}
