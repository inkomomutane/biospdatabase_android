import 'dart:convert';

import 'package:biospdatabase/Model/Benificiary/Benificiary.dart';
import 'package:biospdatabase/Model/DocumentType/DocumentType.dart';
import 'package:biospdatabase/Model/ForwardedService/ForwardedService.dart';
import 'package:biospdatabase/Model/Genre/Genre.dart';
import 'package:biospdatabase/Model/Neighborhood/Neighborhood.dart';
import 'package:biospdatabase/Model/Provenace/Provenace.dart';
import 'package:biospdatabase/Model/PurposeOfVisit/PurposeOfVisit.dart';
import 'package:biospdatabase/Model/ReasonOpeningCase/ReasonOpeningCase.dart';
import 'package:biospdatabase/Syncronization/Syncronization.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

class ServerSync {
  final headers = {
    'Accept': 'application/json',
    'Accept-Encoding': 'application/json',
    'Authorization': 'Bearer ' + Hive.box('token').get('token').toString(),
    'Content-Type': 'application/json'
  };
  final baseUrl = "http://127.0.0.1:8000/api/sync";

  Future settingsOnServer() async {
    var request = http.Request('GET', Uri.parse('${this.baseUrl}/settings'));
    request.headers.addAll(headers);
    print(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var data = jsonDecode(await response.stream.bytesToString());

      ///genres sync database
      var genres = data['genres'];
      var listGenres = List.generate(genres.length, (index) {
        return Genre.fromJson(genres[index]);
      });
      Syncronization.getGenres().deleteAll(Syncronization.getGenres().keys);
      listGenres.forEach((element) {
        Syncronization.getGenres().put(element.uuid, element);
      });

      ///Document type sync database
      var documentTypes = data['document_types'];
      var listDocumentTypes = List.generate(documentTypes.length, (index) {
        return DocumentType.fromJson(documentTypes[index]);
      });
      Syncronization.getDocumentTypes()
          .deleteAll(Syncronization.getDocumentTypes().keys);
      listDocumentTypes.forEach((element) {
        Syncronization.getDocumentTypes().put(element.uuid, element);
      });

      ///forwarded_services  sync database
      var forwardedServices = data['forwarded_services'];
      var listForwardedServices =
          List.generate(forwardedServices.length, (index) {
        return ForwardedService.fromJson(forwardedServices[index]);
      });
      Syncronization.getForwardedServices()
          .deleteAll(Syncronization.getForwardedServices().keys);

      listForwardedServices.forEach((element) {
        Syncronization.getForwardedServices().put(element.uuid, element);
      });

      ///neighborhoods  sync database
      var neighborhoods = data['neighborhoods'];
      var listNeighborhoods = List.generate(neighborhoods.length, (index) {
        return Neighborhood.fromJson(neighborhoods[index]);
      });
      Syncronization.getNeighborhoods()
          .deleteAll(Syncronization.getNeighborhoods().keys);

      listNeighborhoods.forEach((element) {
        Syncronization.getNeighborhoods().put(element.uuid, element);
      });

      ///provenances  sync database
      var provenances = data['provenances'];
      var listProvenances = List.generate(provenances.length, (index) {
        return Provenace.fromJson(provenances[index]);
      });
      Syncronization.getProvenances()
          .deleteAll(Syncronization.getProvenances().keys);

      listProvenances.forEach((element) {
        Syncronization.getProvenances().put(element.uuid, element);
      });

      ///provenances  sync database
      var propusesOfVisits = data['propuses_of_visits'];
      var listPropusesOfVisits =
          List.generate(propusesOfVisits.length, (index) {
        return PurposeOfVisit.fromJson(propusesOfVisits[index]);
      });
      Syncronization.getProposeOfVisits()
          .deleteAll(Syncronization.getProposeOfVisits().keys);

      listPropusesOfVisits.forEach((element) {
        Syncronization.getProposeOfVisits().put(element.uuid, element);
      });

      //reason_of_opening_cases

      var reasonOfOpeningCases = data['reason_of_opening_cases'];
      var listReasonOfOpeningCases =
          List.generate(reasonOfOpeningCases.length, (index) {
        return ReasonOpeningCase.fromJson(reasonOfOpeningCases[index]);
      });
      Syncronization.getReasonsOfOpeningCases()
          .deleteAll(Syncronization.getReasonsOfOpeningCases().keys);

      listReasonOfOpeningCases.forEach((element) {
        Syncronization.getReasonsOfOpeningCases().put(element.uuid, element);
      });

      return data;
    }
    return false;
  }

  Future<bool> storingCratedOnServer(Benificiary benificiary) async {
    var request = http.Request('POST', Uri.parse('${this.baseUrl}/create'));
    request.body = json.encode(benificiary.toJson());
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<bool> storingUpdatedOnServer(Benificiary benificiary) async {
    var request = http.Request(
        'POST', Uri.parse('${this.baseUrl}/update/${benificiary.uuid}'));
    request.body = json.encode(benificiary.toJson());
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<bool> deletingOnServer(Benificiary benificiary) async {
    var request = http.Request(
        'POST', Uri.parse('${this.baseUrl}/delete/${benificiary.uuid}'));
    request.body = json.encode(benificiary.toJson());
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future storinAll() async {
    var toAdd = Syncronization.getCreatedBeneficiaries();
    toAdd.values.toList().forEach((element) async {
      final bool success = await storingCratedOnServer(element);
      if (success &&
          Syncronization.getCreatedBeneficiaries().get(element.uuid) != null) {
        Syncronization.getCreatedBeneficiaries().get(element.uuid)!.delete();
      }
    });
  }

  Future<void> updatingAll() async {
    var toUpdate = Syncronization.getUpdatedBeneficiaries();
    toUpdate.values.toList().forEach((element) async {
      final bool success = await storingUpdatedOnServer(element);
      if (success &&
          Syncronization.getUpdatedBeneficiaries().get(element.uuid) != null) {
        Syncronization.getUpdatedBeneficiaries().get(element.uuid)!.delete();
      }
    });
  }

  Future deletingAll() async {
    var toDelete = Syncronization.getDeletedBeneficiaries();
    toDelete.values.toList().forEach((element) async {
      final bool success = await deletingOnServer(element);
      if (success &&
          Syncronization.getDeletedBeneficiaries().get(element.uuid) != null) {
        Syncronization.getDeletedBeneficiaries().get(element.uuid)!.delete();
      }
    });
  }

  sync() {
    storinAll().then((value) => {
          updatingAll().then((value) => {deletingAll().then((value) => {})})
        });
  }

//asset
  syncSettings() {
    settingsOnServer().then((value) {
      print(value);
    });
  }
}
