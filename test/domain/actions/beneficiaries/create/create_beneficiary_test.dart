import 'package:biosp/core/error_handler.dart';
import 'package:biosp/domain/actions/beneficiary/create_beneficiary.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import '../../../../core/testing_inject.dart';
import '../../../../helpers/helpers.dart';
import '../../../repositories/beneficiaries/create/create_beneficiary_repository_test.mocks.dart';

void main() {
  setUp(() => TestingInject.init());

  test('it action should created beneficiary', () async {
    when(
      GetIt.I<MockCreateBeneficiaryRepository>()(
        beneficiaryEntityTestTrait(),
      ),
    ).thenAnswer(
      (realInvocation) async => ErrorHandler.right(1),
    );

    var task = await GetIt.I<CreateBeneficiary>()(beneficiaryEntityTestTrait());

    task.fold((l) => null, (r) {
      expect(r == 1, true);
    });
  });
}
