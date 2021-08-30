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
  @JsonKey(name: 'number_of_visits')
  late String? numberOfVisits;

  @HiveField(3)
  @JsonKey(name: 'birth_date')
  late DateTime? birthDate;

  @HiveField(4)
  @JsonKey(name: 'phone')
  late String? phone;

  @HiveField(5)
  @JsonKey(name: 'service_date')
  late DateTime? serviceDate;

  @HiveField(6)
  @JsonKey(name: 'home_care')
  late String? homeCare;

  @HiveField(7)
  @JsonKey(name: 'purpose_of_visit')
  late String? purposeOfVisit;

  @HiveField(8)
  @JsonKey(name: 'date_received')
  late DateTime? dateReceived;

  @HiveField(9)
  @JsonKey(name: 'status')
  late bool? status;

  @HiveField(10)
  @JsonKey(name: 'neighborhood_uuid')
  late String? neighborhoodUuid;

  @HiveField(11)
  @JsonKey(name: 'genre_uuid')
  late String? genreUuid;

  @HiveField(12)
  @JsonKey(name: 'provenace_uuid')
  late String? provenaceUuid;

  @HiveField(13)
  @JsonKey(name: 'reason_opening_case_uuid')
  late String? reasonOpeningCaseUuid;

  @HiveField(14)
  @JsonKey(name: 'document_type_uuid')
  late String? documentTypeUuid;

  @HiveField(15)
  @JsonKey(name: 'created_at')
  late DateTime createdAt;

  @HiveField(16)
  @JsonKey(name: 'update_at')
  late DateTime updatedAt;

  Benificiary(
      {required this.uuid,
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
