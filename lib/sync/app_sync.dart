import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:isar/isar.dart';

import '../core/constants.dart';
import '../core/error_handler.dart';
import '../data/datasource/graphql/get_all_document_types_graphql_datasource.dart';
import '../data/datasource/graphql/get_all_forwarded_services_graphql_datasource.dart';
import '../data/datasource/graphql/get_all_genres_graphql_datasource.dart';
import '../data/datasource/graphql/get_all_provenance_graphql_datasource.dart';
import '../data/datasource/graphql/get_all_purpose_of_visit_graphql_datasource.dart';
import '../data/datasource/graphql/get_all_reasons_of_opening_case_graphql_datasource.dart';
import '../data/datasource/graphql/get_biosp_graphql_datasource.dart';
import '../data/datasource/isar/datasource/internal/create_biosp_datasource.dart';
import '../data/datasource/isar/datasource/internal/create_document_type_datasource.dart';
import '../data/datasource/isar/datasource/internal/create_forwarded_service_datasource.dart';
import '../data/datasource/isar/datasource/internal/create_genre_datasource.dart';
import '../data/datasource/isar/datasource/internal/create_provenance_datasource.dart';
import '../data/datasource/isar/datasource/internal/create_purpose_of_visit_datasource.dart';
import '../data/datasource/isar/datasource/internal/create_reason_of_opening_case_datasource.dart';
import '../data/datasource/isar/model/beneficiaries/beneficiary.dart';
import '../data/datasource/isar/model/sync.dart';
import '../data/dto/beneficiaries/beneficiary_dto.dart';
import '../data/dto/biosps/biosp_dto.dart';
import '../data/dto/document_types/document_type_dto.dart';
import '../data/dto/forwarded_services/forwarded_service_dto.dart';
import '../data/dto/genres/genre_dto.dart';
import '../data/dto/provenances/provenance_dto.dart';
import '../data/dto/purpose_of_visits/purpose_of_visit_dto.dart';
import '../data/dto/reasons_of_opening_cases/reasons_of_opening_case_dto.dart';

class AppSync {
  final Isar _isar;

  AppSync(this._isar);

  Future<ErrorHandler<bool>> call() async {
    //Stage A insert stored  data to server
    //get all iserted data from isar
    final createdList = _isar.txnSync(() {
      final created = _isar.lWinMapSyncs
          .filter()
          .operationEqualTo(SyncOperations.created)
          .findAllSync()
          .map((e) => e.ulid)
          .toList();

      return _isar.beneficiaries
          .where()
          .anyOf(created, (q, element) => q.ulidEqualTo(element))
          .findAllSync()
          .map((beneficiary) => BeneficiaryDto.fromIsar(beneficiary))
          .toList();
    });
    //send all to server

    // for (var beneficiary in createdList) {
    //   final res = await GetIt.I<CreateBeneficiaryGraphqlDatasource>()(
    //     beneficiary,
    //   );
    //   if (res.isLeft()) return left(res.getLeft().toString());
    // }
    //Stage B insert updated data to server
    //stage C delete deleted data on server
    //stage D fetch all synchronized data!
    final biosps = await _biosps();
    if (biosps.isLeft()) return left(biosps.getLeft().toString());
    final docs = await _documentTypes();
    if (docs.isLeft()) return left(docs.getLeft().toString());
    final services = await _forwardedServices();
    if (services.isLeft()) return left(services.getLeft().toString());
    final genres = await _genres();
    if (genres.isLeft()) return left(genres.getLeft().toString());
    final provenances = await _provenances();
    if (genres.isLeft()) return left(provenances.getLeft().toString());
    final purposesOfVisit = await _purposesOfVisit();
    if (purposesOfVisit.isLeft()) return left(purposesOfVisit.getLeft().toString());
    final reasonsOfOpeningCase = await _reasonsOfOpeningCase();
    if (reasonsOfOpeningCase.isLeft()) return left(reasonsOfOpeningCase.getLeft().toString());

    return right(true);
  }

  Future<ErrorHandler<bool>> _biosps() async {
    final biosps = await GetBiospGraphqlDatasource()();
    return biosps.fold((l) {
      debugPrint(l);
      return left(l);
    }, (element) async {
      final response = await CreateBiospDatasource(_isar)(
        BiospDto.fromIsar(
          element,
        ),
      );
      if (response.isLeft()) {
        debugPrint(response.getLeft().toString());
        return left(response.getLeft().toString());
      }
      return right(true);
    });
  }

  Future<ErrorHandler<bool>> _documentTypes() async {
    final documents = await GetAllDocumentTypesGraphqlDatasource()();
    return documents.fold((l) {
      debugPrint(l);
      return left(l);
    }, (r) async {
      for (var element in r) {
        final response = await CreateDocumentTypeDatasource(_isar)(
          DocumentTypeDto.fromIsar(
            element,
          ),
        );
        if (response.isLeft()) {
          debugPrint(response.getLeft().toString());
          return left(response.getLeft().toString());
        }
      }
      return right(true);
    });
  }

  Future<ErrorHandler<bool>> _forwardedServices() async {
    final forwardedServices =
        await GetAllForwardedServicesGraphqlDatasource()();
    return forwardedServices.fold((l) {
      debugPrint(l);
      return left(l);
    }, (r) async {
      for (var element in r) {
        final response = await CreateForwardedServiceDatasource(_isar)(
          ForwardedServiceDto.fromIsar(
            element,
          ),
        );
        if (response.isLeft()) {
          debugPrint(response.getLeft().toString());
          return left(response.getLeft().toString());
        }
      }
      return right(true);
    });
  }

  Future<ErrorHandler<bool>> _genres() async {
    final genres = await GetAllGenresGraphqlDatasource()();
    return genres.fold((l) {
      debugPrint(l);
      return left(l);
    }, (r) async {
      for (var element in r) {
        final response = await CreateGenreDatasource(_isar)(
          GenreDto.fromIsar(
            element,
          ),
        );
        if (response.isLeft()) {
          debugPrint(response.getLeft().toString());
          return left(response.getLeft().toString());
        }
      }
      return right(true);
    });
  }

  Future<ErrorHandler<bool>> _provenances() async {
    final provenances = await GetAllProvenancesGraphqlDatasource()();
    return provenances.fold((l) {
      debugPrint(l);
      return left(l);
    }, (r) async {
      for (var element in r) {
        final response = await CreateProvenanceDatasource(_isar)(
          ProvenanceDto.fromIsar(
            element,
          ),
        );
        if (response.isLeft()) {
          debugPrint(response.getLeft().toString());
          return left(response.getLeft().toString());
        }
      }
      return right(true);
    });
  }

  Future<ErrorHandler<bool>> _purposesOfVisit() async {
    final purposesOfVisit = await GetAllPurposeOfVisitsGraphqlDatasource()();
    return purposesOfVisit.fold((l) {
      debugPrint(l);
      return left(l);
    }, (r) async {
      for (var element in r) {
        final response = await CreatePurposeOfVisitDatasource(_isar)(
          PurposeOfVisitDto.fromIsar(
            element,
          ),
        );
        if (response.isLeft()) {
          debugPrint(response.getLeft().toString());
          return left(response.getLeft().toString());
        }
      }
      return right(true);
    });
  }

  Future<ErrorHandler<bool>> _reasonsOfOpeningCase() async {
    final reasonsOfOpeningCase =
        await GetAllReasonOpeningCasesGraphqlDatasource()();
    return reasonsOfOpeningCase.fold((l) {
      debugPrint(l);
      return left(l);
    }, (r) async {
      for (var element in r) {
        final response = await CreateReasonOfOpeningCaseDatasource(_isar)(
          ReasonOfOpeningCaseDto.fromIsar(
            element,
          ),
        );
        if (response.isLeft()) {
          debugPrint(response.getLeft().toString());
          return left(response.getLeft().toString());
        }
      }
      return right(true);
    });
  }
}
