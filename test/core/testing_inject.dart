import 'package:biosp/data/datasource/isar/model/beneficiaries/beneficiary.dart';
import 'package:biosp/data/datasource/isar/model/biosps/biosp.dart';
import 'package:biosp/data/datasource/isar/model/document_types/document_type.dart';
import 'package:biosp/data/datasource/isar/model/forwarded_services/forwarded_service.dart';
import 'package:biosp/data/datasource/isar/model/genres/genre.dart';
import 'package:biosp/data/datasource/isar/model/provenances/provenance.dart';
import 'package:biosp/data/datasource/isar/model/purposes_of_visit/purpose_of_visit.dart';
import 'package:biosp/data/datasource/isar/model/reasons_of_opening_case/reason_of_opening_case.dart';
import 'package:biosp/domain/actions/beneficiary/create_beneficiary.dart';
import 'package:biosp/domain/actions/beneficiary/delete_beneficiary.dart';
import 'package:biosp/domain/actions/beneficiary/get_beneficiaries.dart';
import 'package:biosp/domain/actions/beneficiary/get_beneficiary_by_id.dart';
import 'package:biosp/domain/repository/create_beneficiary_repository.dart';
import 'package:biosp/domain/repository/delete_beneficiary_repository.dart';
import 'package:biosp/domain/repository/get_beneficiaries_repository.dart';
import 'package:biosp/domain/repository/get_beneficiary_by_id_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:ulid4d/ulid4d.dart';

import '../domain/repositories/beneficiaries/create/create_beneficiary_repository_test.mocks.dart';
import '../domain/repositories/beneficiaries/delete/delete_beneficiary_repository_test.mocks.dart';
import '../domain/repositories/beneficiaries/get/get_beneficiaries_repository_test.mocks.dart';
import '../domain/repositories/beneficiaries/get/get_beneficiary_by_id_repository_test.mocks.dart';

class TestingInject {
  static GetIt init() {
    GetIt getIt = GetIt.I;
    getIt.registerLazySingleton<Isar>(() => Isar.openSync([
          BeneficiarySchema,
          BiospSchema,
          DocumentTypeSchema,
          ForwardedServiceSchema,
          GenreSchema,
          ProvenanceSchema,
          PurposeOfVisitSchema,
          ReasonOfOpeningCaseSchema,
        ]));
    //Repositories Implementations
    getIt.registerLazySingleton<MockCreateBeneficiaryRepository>(
        () => MockCreateBeneficiaryRepository());
    getIt.registerLazySingleton<MockDeleteBeneficiaryRepository>(
        () => MockDeleteBeneficiaryRepository());
    getIt.registerLazySingleton<MockGetBeneficiariesRepository>(
        () => MockGetBeneficiariesRepository());
    getIt.registerLazySingleton<MockGetBeneficiaryByIdRepository>(
        () => MockGetBeneficiaryByIdRepository());

    //Repositories injections
    getIt.registerLazySingleton<CreateBeneficiaryRepository>(
        () => MockCreateBeneficiaryRepository());
    getIt.registerLazySingleton<DeleteBeneficiaryRepository>(
        () => MockDeleteBeneficiaryRepository());
    getIt.registerLazySingleton<GetBeneficiariesRepository>(
        () => MockGetBeneficiariesRepository());
    getIt.registerLazySingleton<GetBeneficiaryByIdRepository>(
        () => MockGetBeneficiaryByIdRepository());

    //Actions injections
    getIt.registerLazySingleton<CreateBeneficiary>(() => CreateBeneficiary(
        createBeneficiaryRepository:
            (GetIt.I<MockCreateBeneficiaryRepository>())));
    getIt.registerLazySingleton<DeleteBeneficiary>(() => DeleteBeneficiary(
        deleteBeneficiaryRepository:
            (GetIt.I<MockDeleteBeneficiaryRepository>())));
    getIt.registerLazySingleton<GetBeneficiaries>(() => GetBeneficiaries(
        getBeneficiariesRepository:
            (GetIt.I<MockGetBeneficiariesRepository>())));
    getIt.registerLazySingleton<GetBeneficiaryById>(() => GetBeneficiaryById(
        getBeneficiaryByIdRepository:
            (GetIt.I<MockGetBeneficiaryByIdRepository>())));

    return getIt;
  }

  static ULID get ulid => ULID.nextULID();
}
