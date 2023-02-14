import 'package:biosp/core/error_handler.dart';
import 'package:biosp/domain/actions/beneficiary/delete_beneficiary.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:ulid4d/ulid4d.dart';

import '../../../../core/testing_inject.dart';
import '../../../repositories/beneficiaries/delete/delete_beneficiary_repository_test.mocks.dart';

void main() {
  late final ULID ulid;

  setUp(() {
    TestingInject.init();
    ulid = ULID.nextULID();
  });

  test('it repository should delete beneficiary by ulid.', () async {
    when(GetIt.I<MockDeleteBeneficiaryRepository>()(ulid)).thenAnswer(
      (answer) async => ErrorHandler.right(1),
    );
    final beneficiaryEntity = await GetIt.I.get<DeleteBeneficiary>()(ulid);

    beneficiaryEntity.fold((l) => null, (r) => expect((r) == 1, true));
  });
}
