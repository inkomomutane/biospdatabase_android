import 'package:biosp/core/error_handler.dart';
import 'package:biosp/domain/actions/beneficiary/get_beneficiary_by_id.dart';
import 'package:biosp/domain/repository/get_beneficiary_by_id_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ulid4d/ulid4d.dart';
import '../../../../helpers/helpers.dart';
import 'get_beneficiary_by_id_test.mocks.dart';


@GenerateNiceMocks([MockSpec<GetBeneficiaryByIdRepository>()])
void main() {
  late final MockGetBeneficiaryByIdRepository mockGetBeneficiaryByIdRepository;
  late final ULID ulid = ULID.nextULID();
  late final GetBeneficiaryById getBeneficiaryById;

  setUp(() {
    mockGetBeneficiaryByIdRepository = MockGetBeneficiaryByIdRepository();
    getBeneficiaryById = GetBeneficiaryById(
        getBeneficiaryByIdRepository: mockGetBeneficiaryByIdRepository);
  });

  test('it repository should return get beneficiary by ulid.', () async {
    when(mockGetBeneficiaryByIdRepository(ulid)).thenAnswer((answer) =>
        Future(() => ErrorHandler.right(beneficiaryEntityTestTrait())));
    final beneficiaryEntity = await getBeneficiaryById(ulid);
    beneficiaryEntity.fold(
        (l) => null, (r) => expect((r) == beneficiaryEntityTestTrait(), true));
  });
}
