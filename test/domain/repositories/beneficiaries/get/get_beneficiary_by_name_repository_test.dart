import 'package:biosp/core/error_handler.dart';
import 'package:biosp/domain/entity/beneficiaries/beneficiary_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../../../helpers/helpers.dart';
import 'get_beneficiary_by_name_repository_test.mocks.dart';

abstract class GetBeneficiaryByNameRepository{
  ErrorHandler<Future<BeneficiaryEntity>> call(String name);
}

@GenerateNiceMocks([MockSpec<GetBeneficiaryByNameRepository>()])
void main() {
  late final MockGetBeneficiaryByNameRepository mockGetBeneficiaryByNameRepository;
  const String name = "Jane Doe";
  setUp(() {
    mockGetBeneficiaryByNameRepository = MockGetBeneficiaryByNameRepository();
  });
  test('it should return get beneficiary by name.', (){
    when(mockGetBeneficiaryByNameRepository(name)).thenReturn(
        ErrorHandler.right(Future.value(beneficiaryEntityTestTrait()))
    );
    mockGetBeneficiaryByNameRepository(name).fold((l) => null, (r) async {
      expect((await r) == beneficiaryEntityTestTrait() ,true);
    });
  });
}