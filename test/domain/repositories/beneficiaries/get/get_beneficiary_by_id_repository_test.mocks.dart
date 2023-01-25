// Mocks generated by Mockito 5.3.2 from annotations
// in biosp/test/domain/repositories/beneficiaries/get/get_beneficiary_by_id_repository_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:biosp/domain/entity/beneficiaries/beneficiary_entity.dart'
    as _i5;
import 'package:biosp/domain/repository/get_beneficiary_by_id_repository.dart'
    as _i3;
import 'package:fpdart/src/either.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:ulid4d/ulid4d.dart' as _i6;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [GetBeneficiaryByIdRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetBeneficiaryByIdRepository extends _i1.Mock
    implements _i3.GetBeneficiaryByIdRepository {
  @override
  _i2.Either<String, _i4.Future<_i5.BeneficiaryEntity>> call(_i6.ULID? ulid) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [ulid],
        ),
        returnValue: _FakeEither_0<String, _i4.Future<_i5.BeneficiaryEntity>>(
          this,
          Invocation.method(
            #call,
            [ulid],
          ),
        ),
        returnValueForMissingStub:
            _FakeEither_0<String, _i4.Future<_i5.BeneficiaryEntity>>(
          this,
          Invocation.method(
            #call,
            [ulid],
          ),
        ),
      ) as _i2.Either<String, _i4.Future<_i5.BeneficiaryEntity>>);
}
