import 'package:biosp/core/error_handler.dart';
import 'package:biosp/domain/repository/get_beneficiaries_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../../../helpers/helpers.dart';
import 'get_beneficiaries_repository_test.mocks.dart';


@GenerateNiceMocks([MockSpec<GetBeneficiariesRepository>()])
void main() {
  late final MockGetBeneficiariesRepository mockGetBeneficiariesRepository;
  setUp(() {
    mockGetBeneficiariesRepository = MockGetBeneficiariesRepository();
  });
  test('it repository should return all beneficiaries.', () async {
    when(mockGetBeneficiariesRepository()).thenAnswer( (answer) =>
      Future(() => ErrorHandler.right(listOfBeneficiaryEntityTestTrait()))
    );
    final beneficiaryEntities = await mockGetBeneficiariesRepository();
    beneficiaryEntities.fold((l) => null, (r) => expect((r).first == listOfBeneficiaryEntityTestTrait().first ,true)
    );
  });
}