import 'package:biosp/core/error_handler.dart';
import 'package:biosp/domain/actions/beneficiary/get_beneficiary_by_id.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:ulid4d/ulid4d.dart';

import '../../../../core/testing_inject.dart';
import '../../../../helpers/helpers.dart';
import '../../../repositories/beneficiaries/get/get_beneficiary_by_ulid_repository_test.mocks.dart';

void main() {
  late final ULID ulid;
  setUp(() {
    TestingInject.init();
    ulid = TestingInject.ulid;
  });

  test('it should get beneficiary by ulid.', () async {
    when(GetIt.I<MockGetBeneficiaryByUlidRepository>()(ulid)).thenAnswer(
      (answer) async => ErrorHandler.right(
        beneficiaryEntityTestTrait(),
      ),
    );
    final beneficiaryEntity = await GetIt.I<GetBeneficiaryByUlid>()(ulid);
    beneficiaryEntity.fold(
        (l) => null, (r) => expect((r) == beneficiaryEntityTestTrait(), true));
  });
}
