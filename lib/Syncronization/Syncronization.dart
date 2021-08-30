import 'package:biospdatabase/Model/Benificiary/Benificiary.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

class Syncronization {
  static Box<Benificiary> getCreatedBeneficiaries() =>
      Hive.box<Benificiary>('createdBenificiaries');

  static Box<Benificiary> getUpdatedBeneficiaries() =>
      Hive.box<Benificiary>('updatedBenificiaries');

  static Box<Benificiary> getDeletedBeneficiaries() =>
      Hive.box<Benificiary>('deletedBenificiaries');

  static Box<Benificiary> getBeneficiaries() =>
      Hive.box<Benificiary>('benificiaries');

  ///Initialization of box storage
  static boot() async {
    Hive.registerAdapter(BenificiaryAdapter());
    await Hive.initFlutter();
    await Hive.openBox<Benificiary>('createdBenificiaries');
    await Hive.openBox<Benificiary>('updatedBenificiaries');
    await Hive.openBox<Benificiary>('deletedBenificiaries');
    await Hive.openBox<Benificiary>('benificiaries');
  }

  Benificiary? getBenificiary(String uuid) {
    var beneficiary = getBeneficiaries().get(uuid);
    if (beneficiary != null) return Benificiary.fromJson(beneficiary.toJson());
    return null;
  }

  bool addCreated(Benificiary benificiary) {
    try {
      getBeneficiaries().put(benificiary.uuid, benificiary);
      var mirror = Benificiary.fromJson(benificiary.toJson());
      getCreatedBeneficiaries().put(mirror.uuid, mirror);
      return true;
    } catch (e) {
      return false;
    }
  }

  bool addUdated(Benificiary benificiary) {
    if (getCreatedBeneficiaries().containsKey(benificiary.uuid)) {
      try {
        var boxBen = getBeneficiaries().get(benificiary.uuid);
        var boxCreatedBen = getCreatedBeneficiaries().get(benificiary.uuid);

        var benificiaryCopy = Benificiary.fromJson(benificiary.toJson());

        boxCreatedBen = benificiary;
        boxBen = benificiaryCopy;

        boxBen.save();
        boxCreatedBen.save();

        return true;
      } catch (e) {
        return false;
      }
    } else if (getUpdatedBeneficiaries().containsKey(benificiary.uuid)) {
      try {
        var boxBen = getBeneficiaries().get(benificiary.uuid);
        var boxUpdatedBen = getUpdatedBeneficiaries().get(benificiary.uuid);

        var benificiaryCopy = Benificiary.fromJson(benificiary.toJson());

        boxUpdatedBen = benificiary;
        boxBen = benificiaryCopy;

        boxBen.save();
        boxUpdatedBen.save();

        return true;
      } catch (e) {
        return false;
      }
    } else {
      try {
        getUpdatedBeneficiaries().put(benificiary.uuid, benificiary);
        return true;
      } catch (e) {
        return false;
      }
    }
  }

  bool addDeleted(Benificiary benificiary) {
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
