import 'package:biosp/core/error_handler.dart';
import 'package:biosp/domain/actions/beneficiary/get_beneficiaries.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import '../../../../core/testing_inject.dart';
import '../../../../helpers/helpers.dart';
import '../../../repositories/beneficiaries/get/get_beneficiaries_repository_test.mocks.dart';

void main() {
  setUp(() => TestingInject.init());
  test('it should get all beneficiaries.', () async {
    when(GetIt.I<MockGetBeneficiariesRepository>()()).thenAnswer(
      (answer) async => ErrorHandler.right(
        listOfBeneficiaryEntityTestTrait(),
      ),
    );
    final beneficiaryEntities = await GetIt.I<GetBeneficiaries>()();
    beneficiaryEntities.fold(
        (l) => null,
        (r) => expect(
            (r).first == listOfBeneficiaryEntityTestTrait().first, true));
  });
}
