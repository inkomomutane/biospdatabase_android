import 'package:biosp/core/error_handler.dart';
import 'package:biosp/domain/repository/create_beneficiary_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../../../helpers/helpers.dart';
import 'create_beneficiary_repository_test.mocks.dart';

@GenerateNiceMocks([MockSpec<CreateBeneficiaryRepository>()])
void main() {
  late final MockCreateBeneficiaryRepository mockCreateBeneficiaryRepository;
  setUp(() {
    mockCreateBeneficiaryRepository = MockCreateBeneficiaryRepository();
  });
  test('it repository should return created beneficiary', () async {
    
    when(mockCreateBeneficiaryRepository(beneficiaryEntityTestTrait())).
    thenAnswer((realInvocation) => Future(() => ErrorHandler.right(beneficiaryEntityTestTrait())));
    
    var task = await mockCreateBeneficiaryRepository(beneficiaryEntityTestTrait());

    task.fold((l) => null, (r) {
      expect(r == beneficiaryEntityTestTrait() , true);
    });
  });
}