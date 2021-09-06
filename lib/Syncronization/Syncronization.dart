import 'package:biospdatabase/Model/Benificiary/Benificiary.dart';
import 'package:biospdatabase/Model/DocumentType/DocumentType.dart';
import 'package:biospdatabase/Model/ForwardedService/ForwardedService.dart';
import 'package:biospdatabase/Model/Genre/Genre.dart';
import 'package:biospdatabase/Model/Neighborhood/Neighborhood.dart';
import 'package:biospdatabase/Model/Provenace/Provenace.dart';
import 'package:biospdatabase/Model/PurposeOfVisit/PurposeOfVisit.dart';
import 'package:biospdatabase/Model/ReasonOpeningCase/ReasonOpeningCase.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart';

class Syncronization {
  static getToken() => Hive.box('token');

  static Box<Benificiary> getCreatedBeneficiaries() =>
      Hive.box<Benificiary>('createdBenificiaries');

  static Box<Benificiary> getUpdatedBeneficiaries() =>
      Hive.box<Benificiary>('updatedBenificiaries');

  static Box<Benificiary> getDeletedBeneficiaries() =>
      Hive.box<Benificiary>('deletedBenificiaries');

  static Box<Benificiary> getBeneficiaries() =>
      Hive.box<Benificiary>('benificiaries');

  ///Settings of Aplicattion
  static Box<DocumentType> getDocumentTypes() =>
      Hive.box<DocumentType>('document_types');

  static Box<ForwardedService> getForwardedServices() =>
      Hive.box<ForwardedService>('forwarded_services');

  static Box<Genre> getGenres() => Hive.box<Genre>('genres');

  static Box<Neighborhood> getNeighborhoods() =>
      Hive.box<Neighborhood>('neighborhoods');

  static Box<Provenace> getProvenances() => Hive.box<Provenace>('provenances');

  static Box<PurposeOfVisit> getProposeOfVisits() =>
      Hive.box<PurposeOfVisit>('propose_of_visits');

  static Box<ReasonOpeningCase> getReasonsOfOpeningCases() =>
      Hive.box<ReasonOpeningCase>('reasons_of_opening_cases');

  ///Initialization of box storage
  static Future<void> boot() async {
    await Hive.initFlutter();
    Hive.registerAdapter(BenificiaryAdapter());
    Hive.registerAdapter(DocumentTypeAdapter());
    Hive.registerAdapter(ForwardedServiceAdapter());
    Hive.registerAdapter(GenreAdapter());
    Hive.registerAdapter(NeighborhoodAdapter());
    Hive.registerAdapter(ProvenaceAdapter());
    Hive.registerAdapter(PurposeOfVisitAdapter());
    Hive.registerAdapter(ReasonOpeningCaseAdapter());
    //
    await Hive.openBox<Benificiary>('createdBenificiaries');
    await Hive.openBox<Benificiary>('updatedBenificiaries');
    await Hive.openBox<Benificiary>('deletedBenificiaries');
    await Hive.openBox<Benificiary>('benificiaries');
    await Hive.openBox('token');

    ///Settings of Aplicattion
    await Hive.openBox<DocumentType>('document_types');
    await Hive.openBox<ForwardedService>('forwarded_services');
    await Hive.openBox<Genre>('genres');
    await Hive.openBox<Neighborhood>('neighborhoods');
    await Hive.openBox<Provenace>('provenances');
    await Hive.openBox<PurposeOfVisit>('propose_of_visits');
    await Hive.openBox<ReasonOpeningCase>('reasons_of_opening_cases');
  }

  Benificiary? getBenificiary(String uuid) {
    var beneficiary = getBeneficiaries().get(uuid);
    if (beneficiary != null) return Benificiary.fromJson(beneficiary.toJson());
    return null;
  }

  static bool addCreated(Benificiary benificiary) {
    try {
      getBeneficiaries().put(benificiary.uuid, benificiary);
      var mirror = Benificiary.fromJson(benificiary.toJson());
      getCreatedBeneficiaries().put(mirror.uuid, mirror);
      return true;
    } catch (e) {
      return false;
    }
  }

  static bool addUdated(Benificiary benificiary) {
    if (getCreatedBeneficiaries().containsKey(benificiary.uuid)) {
      try {
        var benificiaryCopy = Benificiary.fromJson(benificiary.toJson());
        getBeneficiaries().put(benificiary.uuid, benificiary);
        getCreatedBeneficiaries().put(benificiaryCopy.uuid, benificiaryCopy);
        return true;
      } catch (e) {
        return false;
      }
    } else if (getUpdatedBeneficiaries().containsKey(benificiary.uuid)) {
      try {
        var benificiaryCopy = Benificiary.fromJson(benificiary.toJson());
        getBeneficiaries().put(benificiary.uuid, benificiary);
        getUpdatedBeneficiaries().put(benificiaryCopy.uuid, benificiaryCopy);
        return true;
      } catch (e) {
        return false;
      }
    } else {
      try {
        var benificiaryCopy = Benificiary.fromJson(benificiary.toJson());
        getBeneficiaries().put(benificiary.uuid, benificiary);
        getUpdatedBeneficiaries().put(benificiaryCopy.uuid, benificiaryCopy);
        return true;
      } catch (e) {
        return false;
      }
    }
  }

  static bool addDeleted(Benificiary benificiary) {
    var benificiaries = getBeneficiaries().get(benificiary.uuid);
    var inserted = getCreatedBeneficiaries().get(benificiary.uuid);
    var updated = getUpdatedBeneficiaries().get(benificiary.uuid);
    try {
      if (inserted != null) inserted.delete();

      if (updated != null) updated.delete();

      if (benificiaries != null) benificiaries.delete();

      getDeletedBeneficiaries().put(benificiary.uuid, benificiary);

      return true;
    } catch (e) {
      return false;
    }
  }
}
