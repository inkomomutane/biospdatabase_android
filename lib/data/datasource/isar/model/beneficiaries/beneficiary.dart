import 'package:isar/isar.dart';

import '../biosps/biosp.dart';
import '../document_types/document_type.dart';
import '../forwarded_services/forwarded_service.dart';
import '../genres/genre.dart';
import '../provenances/provenance.dart';
import '../purposes_of_visit/purpose_of_visit.dart';
import '../reasons_of_opening_case/reason_of_opening_case.dart';

part 'beneficiary.g.dart';

@collection
class Beneficiary {
  Id id = Isar.autoIncrement;

  late String ulid;
  late String fullName;
  late int numberOfVisits;
  late DateTime birthDate;
  late String phone;
  late DateTime serviceDate;
  late bool homeCare;
  late DateTime dateReceived;
  late String otherReasonOfOpeningCase;
  late String otherDocumentType;
  late String otherForwardedService;
  late String specifyPurposeOfVisit;
  late String visitProposes;
  late bool status;

  final biosp = IsarLink<Biosp>();
  final genre = IsarLink<Genre>();
  final provenance = IsarLink<Provenance>();
  final reasonOfOpeningCase = IsarLink<ReasonOfOpeningCase>();
  final documentType = IsarLink<DocumentType>();
  final forwardedService = IsarLink<ForwardedService>();
  final purposeOfVisit = IsarLink<PurposeOfVisit>();
}
