import 'package:get_it/get_it.dart';
import 'package:graphql/client.dart';
import 'package:isar/isar.dart';

import '../data/datasource/isar/datasource/get_all_beneficiaries_datasource.dart';
import '../data/datasource/isar/datasource/get_all_biosps_datasource.dart';
import '../data/datasource/isar/datasource/get_all_document_types_datasource.dart';
import '../data/datasource/isar/datasource/get_all_forwarded_services_datasource.dart';
import '../data/datasource/isar/datasource/get_all_genres_datasource.dart';
import '../data/datasource/isar/datasource/get_all_provenance_datasource.dart';
import '../data/datasource/isar/datasource/get_all_purpose_of_visit_datasource.dart';
import '../data/datasource/isar/datasource/get_all_reasons_of_opening_case_datasource.dart';
import '../data/datasource/isar/datasource/internal/get_auth_user_datasource.dart';
import '../data/datasource/isar/model/auth/auth.dart';
import '../data/datasource/isar/model/beneficiaries/beneficiary.dart';
import '../data/datasource/isar/model/biosps/biosp.dart';
import '../data/datasource/isar/model/document_types/document_type.dart';
import '../data/datasource/isar/model/forwarded_services/forwarded_service.dart';
import '../data/datasource/isar/model/genres/genre.dart';
import '../data/datasource/isar/model/provenances/provenance.dart';
import '../data/datasource/isar/model/purposes_of_visit/purpose_of_visit.dart';
import '../data/datasource/isar/model/reasons_of_opening_case/reason_of_opening_case.dart';
import '../domain/actions/beneficiary/get_beneficiaries.dart';
import '../domain/actions/biosp_services/get_all_biosps.dart';
import '../domain/actions/biosp_services/get_all_document_types.dart';
import '../domain/actions/biosp_services/get_all_forwarded_services.dart';
import '../domain/actions/biosp_services/get_all_genres.dart';
import '../domain/actions/biosp_services/get_all_provenance.dart';
import '../domain/actions/biosp_services/get_all_purpuse_of_visits.dart';
import '../domain/actions/biosp_services/get_all_reasons_of_opening_case.dart';
import '../domain/actions/get_auth_user.dart';
import '../domain/repository/get_all_biosps_repository.dart';
import '../domain/repository/get_all_document_types_repository.dart';
import '../domain/repository/get_all_forwarded_services_repository.dart';
import '../domain/repository/get_all_genres_repository.dart';
import '../domain/repository/get_all_provenance_repository.dart';
import '../domain/repository/get_all_purpuse_of_visits_repository.dart';
import '../domain/repository/get_all_reasons_of_opening_case_repository.dart';
import '../domain/repository/get_beneficiaries_repository.dart';
import '../domain/repository/get_stored_auth_user_repository.dart';

class Inject {
  static void init() {
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
          AuthSchema,
        ]));
    getIt.registerLazySingleton<AuthLink>(() => AuthLink(
        getToken: () => 'Bearer ${GetIt.I<Isar>().auths.getSync(1)?.token}'));
    getIt.registerLazySingleton<Link>(() =>
        GetIt.I<AuthLink>().concat(HttpLink('http://127.0.0.1:8000/graphql')));
    getIt.registerLazySingleton<GraphQLClient>(
      () => GraphQLClient(
        alwaysRebroadcast: true,
        cache: GraphQLCache(),
        link: GetIt.instance<Link>(),
      ),
    );

    /// Datasource Injecting.
    getIt.registerLazySingleton<GetAuthUserDatasource>(
      () => GetAuthUserDatasource(
        GetIt.I<Isar>(),
      ),
    );
    getIt.registerLazySingleton<GetAllBiospsDatasource>(
      () => GetAllBiospsDatasource(
        GetIt.I<Isar>(),
      ),
    );
    getIt.registerLazySingleton<GetAllDocumentTypesDatasource>(
      () => GetAllDocumentTypesDatasource(
        GetIt.I<Isar>(),
      ),
    );
    getIt.registerLazySingleton<GetAllForwardedServicesDatasource>(
      () => GetAllForwardedServicesDatasource(
        GetIt.I<Isar>(),
      ),
    );
    getIt.registerLazySingleton<GetAllGenresDatasource>(
      () => GetAllGenresDatasource(
        GetIt.I<Isar>(),
      ),
    );
    getIt.registerLazySingleton<GetAllProvenancesDatasource>(
      () => GetAllProvenancesDatasource(
        GetIt.I<Isar>(),
      ),
    );
    getIt.registerLazySingleton<GetAllPurposeOfVisitsDatasource>(
      () => GetAllPurposeOfVisitsDatasource(
        GetIt.I<Isar>(),
      ),
    );
    getIt.registerLazySingleton<GetAllReasonOfOpeningCasesDatasource>(
      () => GetAllReasonOfOpeningCasesDatasource(
        GetIt.I<Isar>(),
      ),
    );
    //// Beneficiary operations Datasource Injecting.
    getIt.registerLazySingleton<GetAllBeneficiariesDatasource>(
      () => GetAllBeneficiariesDatasource(
        GetIt.I<Isar>(),
      ),
    );

    /// Repositories Injecting
    getIt.registerLazySingleton<GetAuthUserRepository>(
      () => GetIt.I<GetAuthUserDatasource>(),
    );
    getIt.registerLazySingleton<GetAllBiospsRepository>(
      () => GetIt.I<GetAllBiospsDatasource>(),
    );
    getIt.registerLazySingleton<GetAllDocumentTypesRepository>(
      () => GetIt.I<GetAllDocumentTypesDatasource>(),
    );
    getIt.registerLazySingleton<GetAllForwardedServicesRepository>(
      () => GetIt.I<GetAllForwardedServicesDatasource>(),
    );
    getIt.registerLazySingleton<GetAllGenresRepository>(
      () => GetIt.I<GetAllGenresDatasource>(),
    );
    getIt.registerLazySingleton<GetAllProvenancesRepository>(
      () => GetIt.I<GetAllProvenancesDatasource>(),
    );
    getIt.registerLazySingleton<GetAllPurposeOfVisitsRepository>(
      () => GetIt.I<GetAllPurposeOfVisitsDatasource>(),
    );
    getIt.registerLazySingleton<GetAllReasonOfOpeningCasesRepository>(
      () => GetIt.I<GetAllReasonOfOpeningCasesDatasource>(),
    );
    //// Beneficiary operations Repositories Injecting.
    getIt.registerLazySingleton<GetBeneficiariesRepository>(
      () => GetIt.I<GetAllBeneficiariesDatasource>(),
    );

    /// Actions Injecting
    getIt.registerLazySingleton<GetAuthUser>(
      () => GetAuthUser(
        GetIt.I<GetAuthUserRepository>(),
      ),
    );
    getIt.registerLazySingleton<GetAllBiosps>(
      () => GetAllBiosps(
        GetIt.I<GetAllBiospsRepository>(),
      ),
    );
    getIt.registerLazySingleton<GetAllDocumentTypes>(
      () => GetAllDocumentTypes(
        GetIt.I<GetAllDocumentTypesRepository>(),
      ),
    );
    getIt.registerLazySingleton<GetAllForwardedServices>(
      () => GetAllForwardedServices(
        GetIt.I<GetAllForwardedServicesRepository>(),
      ),
    );
    getIt.registerLazySingleton<GetAllGenres>(
      () => GetAllGenres(
        GetIt.I<GetAllGenresRepository>(),
      ),
    );
    getIt.registerLazySingleton<GetAllProvenances>(
      () => GetAllProvenances(
        GetIt.I<GetAllProvenancesRepository>(),
      ),
    );
    getIt.registerLazySingleton<GetAllPurposeOfVisits>(
      () => GetAllPurposeOfVisits(
        GetIt.I<GetAllPurposeOfVisitsRepository>(),
      ),
    );
    getIt.registerLazySingleton<GetAllReasonOfOpeningCases>(
      () => GetAllReasonOfOpeningCases(
        GetIt.I<GetAllReasonOfOpeningCasesRepository>(),
      ),
    );
    //// Beneficiary operations Actions Injecting.
    getIt.registerLazySingleton<GetBeneficiaries>(
      () => GetBeneficiaries(
        getBeneficiariesRepository: GetIt.I<GetBeneficiariesRepository>(),
      ),
    );
  }

  static String toUppercase(String? string) => string!.toUpperCase();
  static String toLowerCase(String? string) => string!.toLowerCase();
}
