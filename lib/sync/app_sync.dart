import 'package:biosp/core/enums.dart';
import 'package:biosp/data/datasource/graphql/create_beneficiary_datasource.dart';
import 'package:biosp/data/datasource/graphql/get_all_document_types_graphql_datasource.dart';
import 'package:biosp/data/datasource/graphql/get_all_forwarded_services_graphql_datasource.dart';
import 'package:biosp/data/datasource/graphql/get_biosp_graphql_datasource.dart';
import 'package:biosp/data/datasource/isar/datasource/internal/create_biosp_datasource.dart';
import 'package:biosp/data/datasource/isar/datasource/internal/create_document_type_datasource.dart';
import 'package:biosp/data/datasource/isar/datasource/internal/create_forwarded_service_datasource.dart';
import 'package:biosp/data/datasource/isar/model/beneficiaries/beneficiary.dart';
import 'package:biosp/data/datasource/isar/model/sync.dart';
import 'package:biosp/data/dto/beneficiaries/beneficiary_dto.dart';
import 'package:biosp/data/dto/biosps/biosp_dto.dart';
import 'package:biosp/data/dto/forwarded_services/forwarded_service_dto.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:flutter/material.dart';

import '../core/error_handler.dart';
import '../data/dto/document_types/document_type_dto.dart';

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

    for (var beneficiary in createdList) {
      final res = await GetIt.I<CreateBeneficiaryGraphqlDatasource>()(
        beneficiary,
      );
      if (res.isLeft()) return left(res.getLeft().toString());
    }
    //Stage B insert updated data to server
    //stage C delete deleted data on server
    //stage D fetch all synchronized data!
    final biosps = await _biosps();
    if (biosps.isLeft()) return left(biosps.getLeft().toString());
    final docs = await _documentTypes();
    if (docs.isLeft()) return left(docs.getLeft().toString());
    final services = await _forwardedServices();
    if (services.isLeft()) return left(services.getLeft().toString());


    return right(true);
  }

  Future<ErrorHandler<bool>> _biosps() async {
    final biosps =
    await GetBiospGraphqlDatasource()();
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




}
