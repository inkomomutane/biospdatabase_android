import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';

import '../data/datasource/isar/model/beneficiaries/beneficiary.dart';
import '../data/datasource/isar/model/biosps/biosp.dart';
import '../data/datasource/isar/model/document_types/document_type.dart';
import '../data/datasource/isar/model/forwarded_services/forwarded_service.dart';
import '../data/datasource/isar/model/genres/genre.dart';
import '../data/datasource/isar/model/provenances/provenance.dart';
import '../data/datasource/isar/model/purposes_of_visit/purpose_of_visit.dart';
import '../data/datasource/isar/model/reasons_of_opening_case/reason_of_opening_case.dart';

class Inject {
  static void init() {
    GetIt getIt = GetIt.I;
    getIt.registerLazySingletonAsync<Isar>(() => Isar.open([
          BeneficiarySchema,
          BiospSchema,
          DocumentTypeSchema,
          ForwardedServiceSchema,
          GenreSchema,
          ProvenanceSchema,
          PurposeOfVisitSchema,
          ReasonOfOpeningCaseSchema,
        ]));
  }
}
