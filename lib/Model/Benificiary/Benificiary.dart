import 'package:biospdatabase/Model/Model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Benificiary.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class Benificiary extends Model {
  @HiveField(0)
  String? uuid;

  @HiveField(1)
  @JsonKey(name: 'full_name')
  String? fullName;

  @HiveField(2)
  @JsonKey(name: 'number_of_visits')
  final String? numberOfVisits;

  @HiveField(3)
  @JsonKey(name: 'birth_date')
  final DateTime? birthDate;

  @HiveField(4)
  @JsonKey(name: 'phone')
  final String? phone;

  @HiveField(5)
  @JsonKey(name: 'service_date')
  final DateTime? serviceDate;

  @HiveField(6)
  @JsonKey(name: 'home_care')
  final String? homeCare;

  @HiveField(7)
  @JsonKey(name: 'purpose_of_visit')
  final String? purposeOfVisit;

  @HiveField(8)
  @JsonKey(name: 'date_received')
  final DateTime? dateReceived;

  @HiveField(9)
  @JsonKey(name: 'status')
  final bool? status;

  @HiveField(10)
  @JsonKey(name: 'neighborhood_uuid')
  final String? neighborhoodUuid;

  @HiveField(11)
  @JsonKey(name: 'genre_uuid')
  final String? genreUuid;

  @HiveField(12)
  @JsonKey(name: 'provenace_uuid')
  final String? provenaceUuid;

  @HiveField(13)
  @JsonKey(name: 'reason_opening_case_uuid')
  final String? reasonOpeningCaseUuid;

  @HiveField(14)
  @JsonKey(name: 'document_type_uuid')
  final String? documentTypeUuid;

  @HiveField(15)
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @HiveField(16)
  @JsonKey(name: 'update_at')
  final DateTime updatedAt;

  Benificiary(
      {this.uuid,
      this.fullName,
      this.numberOfVisits,
      this.birthDate,
      this.phone,
      this.serviceDate,
      this.homeCare,
      this.purposeOfVisit,
      this.dateReceived,
      this.status,
      this.neighborhoodUuid,
      this.genreUuid,
      this.provenaceUuid,
      this.reasonOpeningCaseUuid,
      this.documentTypeUuid,
      required this.createdAt,
      required this.updatedAt});
  factory Benificiary.fromJson(Map<String, dynamic> json) =>
      _$BenificiaryFromJson(json);
  Map<String, dynamic> toJson() => _$BenificiaryToJson(this);
}
