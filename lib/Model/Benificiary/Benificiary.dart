import 'package:biospdatabase/Model/Model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Benificiary.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class Benificiary extends Model {
  @HiveField(0)
  final String uuid;

  @HiveField(1)
  @JsonKey(name: 'full_name')
  late final String? fullName;

  @HiveField(2)
  @JsonKey(name: 'neighborhood_uuid')
  late String? neighborhoodUuid;

  @HiveField(3)
  @JsonKey(name: 'genre_uuid')
  late String? genreUuid;

  @HiveField(4)
  @JsonKey(name: 'number_of_visits')
  late String? numberOfVisits;

  @HiveField(5)
  @JsonKey(name: 'provenace_uuid')
  late String? provenaceUuid;

  @HiveField(6)
  @JsonKey(name: 'birth_date')
  late DateTime? birthDate;

  @HiveField(7)
  @JsonKey(name: 'phone')
  late String? phone;

  @HiveField(8)
  @JsonKey(name: 'service_date')
  late DateTime? serviceDate;

  @HiveField(9)
  @JsonKey(name: 'purpose_of_visit_uuid')
  late String? purposeOfVisit;

  @HiveField(10)
  @JsonKey(name: 'specify_purpose_of_visit')
  late String? specifyPurposeOfVisit;

  @HiveField(11)
  @JsonKey(name: 'reason_opening_case_uuid')
  late String? reasonOpeningCaseUuid;

  @HiveField(12)
  @JsonKey(name: 'other_reason_opening_case')
  late String? otherReasonOpeningCase;

  @HiveField(13)
  @JsonKey(name: 'document_type_uuid')
  late String? documentTypeUuid;

  @HiveField(14)
  @JsonKey(name: 'other_document_type')
  late String? otherDocumentType;

  @HiveField(15)
  @JsonKey(name: 'forwarded_service_uuid')
  late String? forwardedServiceUuid;

  @HiveField(16)
  @JsonKey(name: 'other_forwarded_service')
  late String? otherForwardedService;

  @HiveField(17)
  @JsonKey(name: 'specify_forwarded_service')
  late String? specifyForwardedService;

  @HiveField(18)
  @JsonKey(name: 'home_care')
  late bool? homeCare;

  @HiveField(19)
  @JsonKey(name: 'visit_proposes')
  late String? visitProposes;

  @HiveField(20)
  @JsonKey(name: 'date_received')
  late DateTime? dateReceived;

  @HiveField(21)
  @JsonKey(name: 'status')
  late bool? status;

  @HiveField(22)
  @JsonKey(name: 'created_at')
  late DateTime createdAt;

  @HiveField(23)
  @JsonKey(name: 'updated_at')
  late DateTime updatedAt;

  @HiveField(24)
  @JsonKey(name: 'known_of_biosp_uuid')
  late String? knownOfBiospUuid;

  @HiveField(25)
  @JsonKey(name: 'other_known_of_biosp')
  late String? otherKnownOfBiosp;

  Benificiary({
    required this.uuid,
    this.fullName,
    this.numberOfVisits,
    this.birthDate,
    this.phone,
    this.serviceDate,
    this.homeCare,
    this.purposeOfVisit,
    this.specifyPurposeOfVisit,
    this.dateReceived,
    this.neighborhoodUuid,
    this.genreUuid,
    this.provenaceUuid,
    this.forwardedServiceUuid,
    this.otherForwardedService,
    this.specifyForwardedService,
    this.reasonOpeningCaseUuid,
    this.otherReasonOpeningCase,
    this.documentTypeUuid,
    this.otherDocumentType,
    this.visitProposes,
    this.status,
    this.knownOfBiospUuid,
    this.otherKnownOfBiosp,
    required this.createdAt,
    required this.updatedAt,
  });
  factory Benificiary.fromJson(Map<String, dynamic> json) =>
      _$BenificiaryFromJson(json);
  Map<String, dynamic> toJson() => _$BenificiaryToJson(this);
}
