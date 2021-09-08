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
    'Authorization': 'Bearer ' + Hive.box('token').get('token').toString(),
    'Content-Type': 'application/json'
  };
  final baseUrl = "https://www.biosp.sumburero.org/api/sync";

  Future settingsOnServer() async {
    var request = http.Request('GET', Uri.parse('${this.baseUrl}/settings'));
    request.headers.addAll(headers);
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

      //benificiaries

      var benificiaries = data['benificiaries'];

      var listBenificiaries = List.generate(benificiaries.length, (index) {
        return Benificiary.fromJson(benificiaries[index]);
      });
      Syncronization.getBeneficiaries()
          .deleteAll(Syncronization.getBeneficiaries().keys);

      listBenificiaries.forEach((element) {
        Syncronization.getBeneficiaries().put(element.uuid, element);
      });

      return data;
    }
    return false;
  }

  Future<bool> storingCratedOnServer() async {
    var request = http.Request('POST', Uri.parse('${this.baseUrl}/create'));
    var created = Syncronization.getCreatedBeneficiaries()
        .values
        .map((e) => e.toJson())
        .toList();

    request.body = json.encode(created);
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 201) {
      try {
        Syncronization.getCreatedBeneficiaries()
            .deleteAll(Syncronization.getCreatedBeneficiaries().keys);
        var result = await response.stream.bytesToString();
        print("result: $result");

        (json.decode(result) as List<Map<String, dynamic>>).forEach((element) {
          Syncronization.getCreatedBeneficiaries()
              .put(element['uuid'], Benificiary.fromJson(element));
        });
        return true;
      } catch (e) {
        print("erro: $e");
        return false;
      }
    }
    return false;
  }

  Future<bool> storingUpdatedOnServer() async {
    var request = http.Request('POST', Uri.parse('${this.baseUrl}/update'));
    var updated = Syncronization.getUpdatedBeneficiaries()
        .values
        .map((e) => e.toJson())
        .toList();

    request.body = json.encode(updated);
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      try {
        Syncronization.getUpdatedBeneficiaries()
            .deleteAll(Syncronization.getUpdatedBeneficiaries().keys);
        var result = await response.stream.bytesToString();

        (json.decode(result) as List<Map<String, dynamic>>).forEach((element) {
          Syncronization.getUpdatedBeneficiaries()
              .put(element['uuid'], Benificiary.fromJson(element));
        });
        return true;
      } catch (e) {
        return false;
      }
    }
    return false;
  }

  Future<bool> deletingOnServer() async {
    var request = http.Request('POST', Uri.parse('${this.baseUrl}/delete'));
    var deleted = Syncronization.getDeletedBeneficiaries()
        .values
        .map((e) => e.toJson())
        .toList();

    request.body = json.encode(deleted);
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      try {
        Syncronization.getDeletedBeneficiaries()
            .deleteAll(Syncronization.getDeletedBeneficiaries().keys);
        var result = await response.stream.bytesToString();
        (json.decode(result) as List<Map<String, dynamic>>).forEach((element) {
          Syncronization.getDeletedBeneficiaries()
              .put(element['uuid'], Benificiary.fromJson(element));
        });
        return true;
      } catch (e) {
        return false;
      }
    }
    return false;
  }

  Future syncSettings() async {
    await storingCratedOnServer();
    await storingUpdatedOnServer();
    await deletingOnServer();
    await settingsOnServer();
  }
}
