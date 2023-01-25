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
  test('it should return all beneficiaries.', (){
    when(mockGetBeneficiariesRepository()).thenReturn(
        ErrorHandler.right(Future.value(listOfBeneficiaryEntityTestTrait()))
    );
    mockGetBeneficiariesRepository().fold((l) => null, (r) async {
      expect((await r).first == listOfBeneficiaryEntityTestTrait().first ,true);
    });
  });
}