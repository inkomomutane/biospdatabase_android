import 'package:biosp/domain/repository/create_beneficiary_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
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
  test('it should return created beneficiary', (){
    when(mockCreateBeneficiaryRepository(beneficiaryEntityTestTrait())).thenReturn(
      Either.right(Future.value(beneficiaryEntityTestTrait()))
    );
    mockCreateBeneficiaryRepository(beneficiaryEntityTestTrait()).fold((l) => null, (r) async {
      expect((await r) == beneficiaryEntityTestTrait() ,true);
    });
  });
}