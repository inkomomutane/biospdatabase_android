import '../data/datasource/isar/datasource/get_all_beneficiaries_datasource.dart';
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
        ]));
    getIt.registerLazySingleton<GetBeneficiariesRepository>(
        () => GetAllBeneficiariesDatasource(GetIt.instance()));
  }

  static int fastHash(String ulid) {
    var hash = 0xcbf29ce484222325;
    var i = 0;
    while (i < ulid.length) {
      final codeUnit = ulid.codeUnitAt(i++);
      hash ^= codeUnit >> 8;
      hash *= 0x100000001b3;
      hash ^= codeUnit & 0xFF;
      hash *= 0x100000001b3;
    }
    return hash;
  }
}
