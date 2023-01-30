import 'package:biosp/domain/actions/beneficiary/create_beneficiary.dart';
import 'package:biosp/domain/actions/beneficiary/delete_beneficiary.dart';
import 'package:biosp/domain/actions/beneficiary/get_beneficiaries.dart';
import 'package:biosp/domain/actions/beneficiary/get_beneficiary_by_id.dart';
import 'package:biosp/domain/repository/create_beneficiary_repository.dart';
import 'package:biosp/domain/repository/delete_beneficiary_repository.dart';
import 'package:biosp/domain/repository/get_beneficiaries_repository.dart';
import 'package:biosp/domain/repository/get_beneficiary_by_id_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:ulid4d/ulid4d.dart';

import '../domain/repositories/beneficiaries/create/create_beneficiary_repository_test.mocks.dart';
import '../domain/repositories/beneficiaries/delete/delete_beneficiary_repository_test.mocks.dart';
import '../domain/repositories/beneficiaries/get/get_beneficiaries_repository_test.mocks.dart';
import '../domain/repositories/beneficiaries/get/get_beneficiary_by_id_repository_test.mocks.dart';


class TestingInject {
  static GetIt init() {
    GetIt getIt = GetIt.I;

    //Repositories Implementations
    getIt.registerLazySingleton<MockCreateBeneficiaryRepository>(() => MockCreateBeneficiaryRepository());
    getIt.registerLazySingleton<MockDeleteBeneficiaryRepository>(() => MockDeleteBeneficiaryRepository());
    getIt.registerLazySingleton<MockGetBeneficiariesRepository>(() => MockGetBeneficiariesRepository());
    getIt.registerLazySingleton<MockGetBeneficiaryByIdRepository>(() => MockGetBeneficiaryByIdRepository());

    //Repositories injections
    getIt.registerLazySingleton<CreateBeneficiaryRepository>(() => MockCreateBeneficiaryRepository());
    getIt.registerLazySingleton<DeleteBeneficiaryRepository>(() => MockDeleteBeneficiaryRepository());
    getIt.registerLazySingleton<GetBeneficiariesRepository>(() => MockGetBeneficiariesRepository());
    getIt.registerLazySingleton<GetBeneficiaryByIdRepository>(() => MockGetBeneficiaryByIdRepository());

    //Actions injections
    getIt.registerLazySingleton<CreateBeneficiary>(() => CreateBeneficiary(createBeneficiaryRepository: (GetIt.I<MockCreateBeneficiaryRepository>())));
    getIt.registerLazySingleton<DeleteBeneficiary>(() => DeleteBeneficiary(deleteBeneficiaryRepository: (GetIt.I<MockDeleteBeneficiaryRepository>())));
    getIt.registerLazySingleton<GetBeneficiaries>(() => GetBeneficiaries(getBeneficiariesRepository: (GetIt.I<MockGetBeneficiariesRepository>())));
    getIt.registerLazySingleton<GetBeneficiaryById>(() => GetBeneficiaryById(getBeneficiaryByIdRepository: (GetIt.I<MockGetBeneficiaryByIdRepository>())));



    return getIt;
  }
  static ULID get ulid => ULID.nextULID();
}
