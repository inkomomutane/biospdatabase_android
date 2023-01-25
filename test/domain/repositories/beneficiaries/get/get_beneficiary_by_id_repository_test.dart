import 'package:biosp/core/error_handler.dart';
import 'package:biosp/domain/repository/get_beneficiary_by_id_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ulid4d/ulid4d.dart';
import '../../../../helpers/helpers.dart';
import 'get_beneficiary_by_id_repository_test.mocks.dart';

@GenerateNiceMocks([MockSpec<GetBeneficiaryByIdRepository>()])
void main() {
  late final MockGetBeneficiaryByIdRepository mockGetBeneficiaryByIdRepository;
  late final ULID ulid = ULID.nextULID();
  setUp(() {
    mockGetBeneficiaryByIdRepository = MockGetBeneficiaryByIdRepository();
  });
  test('it should return get beneficiary by ulid.', (){
    when(mockGetBeneficiaryByIdRepository(ulid)).thenReturn(
        ErrorHandler.right(Future.value(beneficiaryEntityTestTrait()))
    );
    mockGetBeneficiaryByIdRepository(ulid).fold((l) => null, (r) async {
      expect((await r) == beneficiaryEntityTestTrait() ,true);
    });
  });
}