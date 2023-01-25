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
  test('it should return update beneficiary', (){
    when(mockUpdateBeneficiaryRepository(beneficiaryEntityTestTrait())).thenReturn(
        ErrorHandler.right(Future.value(beneficiaryEntityTestTrait()))
    );
    mockUpdateBeneficiaryRepository(beneficiaryEntityTestTrait()).fold((l) => null, (r) async {
      expect((await r) == beneficiaryEntityTestTrait() ,true);
    });
  });
}