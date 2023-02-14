import 'package:biosp/core/error_handler.dart';
import 'package:biosp/domain/repository/update_beneficiary_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../../../helpers/helpers.dart';
import 'update_beneficiary_repository_test.mocks.dart';

@GenerateNiceMocks([MockSpec<UpdateBeneficiaryRepository>()])
void main() {
  late final MockUpdateBeneficiaryRepository mockUpdateBeneficiaryRepository;
  setUp(() {
    mockUpdateBeneficiaryRepository = MockUpdateBeneficiaryRepository();
  });
  test('it repository should return update beneficiary', () async {
    when(mockUpdateBeneficiaryRepository(beneficiaryEntityTestTrait()))
        .thenAnswer((answer) async => ErrorHandler.right(1));
    final beneficiaryEntity =
        await mockUpdateBeneficiaryRepository(beneficiaryEntityTestTrait());
    beneficiaryEntity.fold((l) => null, (r) => expect((r) == 1, true));
  });
}
