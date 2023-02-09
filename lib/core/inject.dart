import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:graphql/client.dart';

import '../data/datasource/isar/datasource/get_all_beneficiaries_datasource.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';

import '../data/datasource/isar/model/auth/auth.dart';
import '../data/datasource/isar/model/beneficiaries/beneficiary.dart';
import '../data/datasource/isar/model/biosps/biosp.dart';
import '../data/datasource/isar/model/document_types/document_type.dart';
import '../data/datasource/isar/model/forwarded_services/forwarded_service.dart';
import '../data/datasource/isar/model/genres/genre.dart';
import '../data/datasource/isar/model/provenances/provenance.dart';
import '../data/datasource/isar/model/purposes_of_visit/purpose_of_visit.dart';
import '../data/datasource/isar/model/reasons_of_opening_case/reason_of_opening_case.dart';
import '../domain/repository/get_beneficiaries_repository.dart';

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
    getIt.registerLazySingleton<GetBeneficiariesRepository>(
        () => GetAllBeneficiariesDatasource(GetIt.instance()));
    getIt.registerLazySingleton<AuthLink>(() => AuthLink(
        getToken: () => 'Bearer ${GetIt.I<Isar>().auths.getSync(1)?.token}'));
    getIt.registerLazySingleton<Link>(() =>
        GetIt.I<AuthLink>().concat(HttpLink('http://127.0.0.1:8000/graphql')));

    getIt.registerLazySingleton<GraphQLClient>(() => GraphQLClient(
      alwaysRebroadcast: true,
          cache: GraphQLCache(
          ),
          link: GetIt.instance<Link>(),
        ));
  }

  static String toUppercase(String? string) => string!.toUpperCase();
  static String toLowerCase(String? string) => string!.toLowerCase();
}

@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse notificationResponse) {
  // handle action
}
